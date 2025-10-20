{
  description = "A custom Neovim configuration for Nix users.";

  inputs.nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

  outputs =
    { self, nixpkgs, ... }:
    let
      mkPkgs =
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ self.overlays.default ];
        };

      forEachSystem =
        f:
        nixpkgs.lib.genAttrs [
          "x86_64-linux"
          "aarch64-linux"
        ] (system: f (mkPkgs system));
    in
    {
      overlays.default = import ./pkgs { inherit (nixpkgs) lib; };

      packages = forEachSystem (pkgs: {
        default = pkgs.rx-nvim;
      });

      nixosModules.default = {
        nixpkgs.overlays = [ self.overlays.default ];
        imports = [ ./modules ];
      };

      devShells = forEachSystem (pkgs: {
        default = pkgs.mkShell {
          packages = [ pkgs.nvfetcher ];
        };
      });

      checks = forEachSystem (pkgs: {
        rx-nvim = pkgs.nixosTest {
          name = "rx-nvim";
          nodes.machine = {
            imports = [ self.nixosModules.default ];
            programs.rx-nvim.enable = true;
          };

          testScript = ''
            machine.wait_for_unit("default.target")
            machine.succeed("which nvim")
          '';
        };
      });

      formatter = forEachSystem (
        pkgs:
        pkgs.nixfmt-tree.override {
          settings = {
            formatter.stylua = {
              command = "stylua";
              includes = [ "*.lua" ];
            };
            global.excludes = [ "pkgs/_sources/*" ];
          };
          runtimeInputs = [ pkgs.stylua ];
        }
      );
    };
}
