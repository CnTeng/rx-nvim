{ inputs, self, ... }:
{
  flake.nixosModules.default = import ./module.nix self;

  imports = [
    ./devshell.nix
    ./pre-commit.nix
    ./treefmt.nix
  ];

  perSystem =
    {
      pkgs,
      system,
      config,
      ...
    }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = map (n: inputs.${n}.overlays.default) [ "neovim-nightly" ];
      };

      packages.rx-nvim = pkgs.callPackage ../package { };
      packages.default = config.packages.rx-nvim;
    };
}
