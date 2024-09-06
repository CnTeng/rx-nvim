{
  description = "A custom Neovim configuration for Nix users.";

  inputs = {
    # nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs.url = "github:GaetanLepage/nixpkgs/vim-plugins-update";

    flake-parts.url = "github:hercules-ci/flake-parts";

    treefmt = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    pre-commit = {
      url = "github:cachix/pre-commit-hooks.nix";
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
        inputs.pre-commit.flakeModule
        inputs.treefmt.flakeModule
        ./modules
        ./pkgs
      ];

      perSystem =
        { config, pkgs, ... }:
        {
          devShells.default = pkgs.mkShell {
            packages = with pkgs; [
              nvfetcher
              config.treefmt.build.wrapper
            ];

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

          pre-commit.settings.hooks = {
            treefmt.enable = true;
            commitizen.enable = true;
          };

          treefmt = {
            projectRootFile = "flake.nix";

            programs = {
              nixfmt.enable = true;
              prettier.enable = true;
              stylua.enable = true;
              taplo.enable = true;
            };

            settings.global.excludes = [ "pkgs/_sources/*" ];
          };
        };
    };
}
