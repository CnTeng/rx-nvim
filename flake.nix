{
  description = "A custom Neovim configuration for Nix users.";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    git-hooks-nix = {
      url = "github:cachix/git-hooks.nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs =
    inputs@{ self, flake-parts, ... }:
    flake-parts.lib.mkFlake { inherit inputs; } {
      systems = [
        "x86_64-linux"
        "aarch64-linux"
      ];

      imports = [
        inputs.git-hooks-nix.flakeModule
        ./modules
        ./pkgs
      ];

      perSystem =
        { config, pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = [ pkgs.nvfetcher ];
            shellHook = config.pre-commit.installationScript;
          };

          checks.rx-nvim = pkgs.nixosTest {
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

          formatter = pkgs.nixfmt-tree.override {
            settings = {
              formatter.stylua = {
                command = "stylua";
                includes = [ "*.lua" ];
              };
              global.excludes = [ "pkgs/_sources/*" ];
            };
            runtimeInputs = [ pkgs.stylua ];
          };

          pre-commit.settings.hooks = {
            treefmt = {
              enable = true;
              package = config.formatter;
            };
            commitizen.enable = true;
          };
        };
    };
}
