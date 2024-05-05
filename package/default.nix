{ inputs, self, ... }:
{
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
        overlays = [
          self.overlays.default
          inputs.neovim-nightly.overlays.default
        ];
      };

      packages.rx-nvim = pkgs.callPackage ./rx-nvim.nix { };
      packages.default = config.packages.rx-nvim;
    };
}
