const std = @import("std");

const Scanner = @import("zig-wayland").Scanner;

pub fn build(b: *std.Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const use_gl = b.option(bool, "GL", "Use OpenGL instead of Vulkan") orelse false;
    const exe = b.addExecutable(.{
        .name = "Simp",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const scanner = Scanner.create(b, .{});
    const wayland = b.createModule(.{ .root_source_file = scanner.result });
    scanner.addCustomProtocol("protocols/wayland/xdg-shell.xml");
    scanner.addSystemProtocol("staging/ext-session-lock/ext-session-lock-v1.xml");

    scanner.generate("wl_seat", 5);
    scanner.generate("wl_compositor", 5);
    scanner.generate("wl_shm", 2);
    scanner.generate("xdg_wm_base", 6);

    if (use_gl) {
        const gl_bindings = @import("zigglgen").generateBindingsModule(b, .{
            .api = .gl,
            .version = .@"4.1",
            .profile = .core,
        });
        exe.root_module.addImport("gl", gl_bindings);
    } else {
        if (b.lazyDependency("vulkan-zig", .{
            .target = target,
            .optimize = optimize,
            .registry = @as([]const u8, b.pathFromRoot("protocols/vulkan/vk.xml")),
        })) |vkzig_dep| {
            const vkzig_bindings = vkzig_dep.module("vulkan-zig");
            exe.root_module.addImport("vulkan", vkzig_bindings);
        }
    }

    exe.root_module.addImport("wayland", wayland);
    exe.linkSystemLibrary("wayland-client");
    exe.linkLibC();
    // TODO: remove when https://github.com/ziglang/zig/issues/131 is implemented
    scanner.addCSource(exe);

    b.installArtifact(exe);
    const run_cmd = b.addRunArtifact(exe);
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run Program");
    run_step.dependOn(&run_cmd.step);
}
