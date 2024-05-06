{
  inputs,
  lib,
  self,
  withSystem,
  ...
}:
{
  flake.overlays = {
    default = lib.composeManyExtensions ([
      inputs.neovim-nightly.overlays.default
      self.overlays.rx-nvim
      self.overlays.plugins
    ]);

    rx-nvim =
      final: prev:
      withSystem prev.stdenv.hostPlatform.system (
        { config, ... }:
        {
          rx-nvim = config.packages.default;
        }
      );

    plugins =
      final: prev:
      let
        sources = final.callPackage ./_sources/generated.nix { };

        mkPackage = src: pname: final.vimUtils.buildVimPlugin sources.${src} // { inherit pname; };

        mkOverride =
          n:
          prev.vimPlugins.${n}.overrideAttrs (_: {
            inherit (sources.${n}) src;
          });
      in
      {
        vimPlugins = prev.vimPlugins // {
          gp-nvim = mkPackage "gp-nvim" "gp.nvim";

          bufferline-nvim = mkOverride "bufferline-nvim";
          flash-nvim = mkOverride "flash-nvim";
        };
      };
  };

  perSystem =
    { system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        overlays = [ self.overlays.default ];
      };
    };
}
