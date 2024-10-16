const std = @import("std");

const Scanner = @import("zig-wayland").Scanner;

pub fn build(b: *std.Build) !void {
    const stdout = std.io.getStdOut().writer();
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const exe = b.addExecutable(.{
        .name = "Simp",
        .root_source_file = b.path("src/main.zig"),
        .target = target,
        .optimize = optimize,
    });

    const wl_scanner = Scanner.create(b, .{});
    const wayland = b.createModule(.{ .root_source_file = wl_scanner.result });
    wl_scanner.addCustomProtocol("protocols/wayland/xdg-shell.xml");
    wl_scanner.addSystemProtocol("staging/ext-session-lock/ext-session-lock-v1.xml");

    wl_scanner.generate("wl_seat", 5);
    wl_scanner.generate("wl_compositor", 5);
    wl_scanner.generate("wl_shm", 2);
    wl_scanner.generate("xdg_wm_base", 6);

    const exe_options = b.addOptions();
    exe_options.addOption(bool, "use_gl", b.option(bool, "use_gl", "Use OpenGL instead of Vulkan") orelse false);
    exe.root_module.addOptions("build_options", exe_options);

    if (b.lazyDependency("vulkan-zig", .{
        .target = target,
        .optimize = optimize,
        .registry = @as([]const u8, b.pathFromRoot("protocols/vulkan/vk.xml")),
    })) |vkzig_dep| {
        try stdout.print("Building Vulkan graphics dep\n", .{});
        const vkzig_bindings = vkzig_dep.module("vulkan-zig");
        exe.root_module.addImport("vulkan", vkzig_bindings);
    }
    if (b.lazyDependency("zigglgen", .{
        .target = target,
        .optimize = optimize,
    })) |zigglgen_dep| {
        try stdout.print("Building OpenGL graphics dep\n", .{});
        const zigglgen_opts: @import("zigglgen").GeneratorOptions = .{
            .api = .gl,
            .version = .@"4.1",
            .profile = .core,
        };
        const zigglgen_exe = zigglgen_dep.artifact("zigglgen");
        const run_zigglgen = b.addRunArtifact(zigglgen_exe);
        run_zigglgen.addArg(b.fmt("{s}-{s}{s}{s}", .{
            @tagName(zigglgen_opts.api),
            @tagName(zigglgen_opts.version),
            if (zigglgen_opts.profile) |_| "-" else "",
            if (zigglgen_opts.profile) |profile| @tagName(profile) else "",
        }));
        for (zigglgen_opts.extensions) |extension| run_zigglgen.addArg(@tagName(extension));
        const gl_bindings_file = run_zigglgen.captureStdOut();
        run_zigglgen.captured_stdout.?.basename = "gl.zig";

        const gl_bindings = b.createModule(.{
            .root_source_file = gl_bindings_file,
        });
        exe.root_module.addImport("gl", gl_bindings);
    }

    exe.root_module.addImport("wayland", wayland);
    exe.linkSystemLibrary("wayland-client");
    exe.linkLibC();

    // TODO: remove when https://github.com/ziglang/zig/issues/131 is implemented
    wl_scanner.addCSource(exe);

    b.installArtifact(exe);
    const run_cmd = b.addRunArtifact(exe);
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run Program");
    run_step.dependOn(&run_cmd.step);
}
