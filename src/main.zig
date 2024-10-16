const std = @import("std");
const mem = std.mem;
const posix = std.posix;
const build_options = @import("build_options");

const graphics_import = switch (build_options.use_gl) {
    true => @import("gl"),
    false => @import("vulkan"),
};

const wayland = @import("wayland");
const wl = wayland.client.wl;
const xdg = wayland.client.xdg;

const ClientContext = struct {
    // zig fmt: off
    display:      ?*wl.Display = null,
    registry:     ?*wl.Registry = null,
    shm:          ?*wl.Shm = null,
    compositor:   ?*wl.Compositor = null,
    wm_base:      ?*xdg.WmBase = null,

    wl_surface:   ?*wl.Surface = null,
    xdg_surface:  ?*xdg.Surface = null,
    xdg_toplevel: ?*xdg.Toplevel = null,
    // zig fmt: on
};

pub fn main() !void {
    std.debug.print("  :: GL ==> {}\n", .{build_options.use_gl});
    var ctx: ClientContext = .{};
    ctx.display = wl.Display.connect(null) catch |err| {
        std.log.err("Failed to connect Wayland display: {}\n", .{err});
        std.process.exit(1);
    };
    ctx.registry = ctx.display.?.getRegistry() catch |err| {
        std.log.err("Failed to acquire Wayland display's registry: {}\n", .{err});
        std.process.exit(1);
    };

    ctx.registry.?.setListener(*ClientContext, registryListener, &ctx);
    if (ctx.display.?.roundtrip() != .SUCCESS) return error.RoundtripFailed;

    const shm = ctx.shm orelse return error.NoWlShm;
    const compositor = ctx.compositor orelse return error.NoWlCompositor;
    const wm_base = ctx.wm_base orelse return error.NoXdgWmBase;

    const width = 960;
    const height = 540;
    const stride = width * 4;
    const size = stride * height;

    const fd = try posix.memfd_create("Simp-Wayland", 0);
    try posix.ftruncate(fd, size);

    const data = try posix.mmap(
        null,
        size,
        posix.PROT.READ | posix.PROT.WRITE,
        .{ .TYPE = .SHARED },
        fd,
        0,
    );

    // Dirty Hack
    {
        const data_u32: [*]u32 = @ptrCast(data);

        for (0..height) |y| {
            for (0..width) |x| {
                if ((x + y / 8 * 8) % 16 < 8) {
                    data_u32[y * width + x] = 0xFF666666;
                } else {
                    data_u32[y * width + x] = 0xFFEEEEEE;
                }
            }
        }
    }

    const pool = try shm.createPool(fd, size);
    defer pool.destroy();
    const buffer = try pool.createBuffer(0, width, height, stride, .xrgb8888);

    defer buffer.destroy();
    posix.munmap(data);

    const surface = compositor.createSurface() catch |err| {
        std.log.err("  Failed to create Surface in compositor: {}", .{err});
        std.process.exit(1);
    };
    defer surface.destroy();

    const xdg_surface = wm_base.getXdgSurface(surface) catch |err| {
        std.log.err("  Failed to create XDG Surface in compositor: {}", .{err});
        std.process.exit(1);
    };
    defer xdg_surface.destroy();
    const xdg_toplevel = xdg_surface.getToplevel() catch |err| {
        std.log.err("  Failed to access XDG Surface Toplevel: {}", .{err});
        std.process.exit(1);
    };
    defer xdg_toplevel.destroy();

    var running = true;

    xdg_surface.setListener(*wl.Surface, xdgSurfaceListener, surface);
    xdg_toplevel.setListener(*bool, xdgToplevelListener, &running);

    surface.commit();
    if (ctx.display.?.roundtrip() != .SUCCESS) return error.RoundtripFailed;

    surface.attach(buffer, 0, 0);
    surface.commit();

    while (running) {
        if (ctx.display.?.dispatch() != .SUCCESS) return error.DispatchFailed;
    }
}

// TODO: Go over these to make sure they're all right
fn registryListener(registry: *wl.Registry, event: wl.Registry.Event, context: *ClientContext) void {
    switch (event) {
        .global => |global| {
            if (mem.orderZ(u8, global.interface, wl.Compositor.getInterface().name) == .eq) {
                context.compositor = registry.bind(global.name, wl.Compositor, 1) catch return;
            } else if (mem.orderZ(u8, global.interface, wl.Shm.getInterface().name) == .eq) {
                context.shm = registry.bind(global.name, wl.Shm, 1) catch return;
            } else if (mem.orderZ(u8, global.interface, xdg.WmBase.getInterface().name) == .eq) {
                context.wm_base = registry.bind(global.name, xdg.WmBase, 1) catch return;
            }
        },
        .global_remove => {},
    }
}

fn xdgSurfaceListener(xdg_surface: *xdg.Surface, event: xdg.Surface.Event, surface: *wl.Surface) void {
    switch (event) {
        .configure => |configure| {
            xdg_surface.ackConfigure(configure.serial);
            surface.commit();
        },
    }
}

fn xdgToplevelListener(_: *xdg.Toplevel, event: xdg.Toplevel.Event, running: *bool) void {
    switch (event) {
        .configure => {},
        .close => running.* = false,
        else => {
            std.log.info("LOG :: Hit unsupported Xdg Toplevel callback: {}", .{event});
        },
    }
}
