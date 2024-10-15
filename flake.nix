{
  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = { self, nixpkgs,... }:
    let
      supportedSystems = [ "x86_64-linux" "aarch64-linux" "x86_64-darwin" "aarch64-darwin" ];
      forEachSupportedSystem = f: nixpkgs.lib.genAttrs supportedSystems (system: f {
        pkgs = import nixpkgs { inherit system; };
      });
    in
    {
      devShells = forEachSupportedSystem({ pkgs }: {
        default = pkgs.mkShell {
          packages = with pkgs; [
            clang
            gcc
            gdb
            pkg-config
            valgrind
            wayland
            wayland-protocols
            wayland-scanner
            zig
          ];
          buildInputs = with pkgs; [
            clang
            gcc
            mesa
            pkg-config
            wayland
            wayland-scanner
            zig
          ];

          shellHook = ''
            alias build='./build.sh'
            export CC='zig cc'
          '';
        };
      });
    };
}
