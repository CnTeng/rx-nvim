{
  inputs,
  lib,
  self,
  ...
}:
{
  flake.overlays = {
    default = lib.composeManyExtensions ([
      self.overlays.plugins
      self.overlays.packages
    ]);

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
          which-key-nvim = mkOverride "which-key-nvim";

          copilot-status-nvim = mkPackage "copilot-status-nvim" "copilot-status.nvim";
          luvit-meta = mkPackage "luvit-meta" "luvit-meta";
          kulala-nvim = mkPackage "kulala-nvim" "kulala.nvim";
        };
      };

    packages =
      final: prev:
      lib.packagesFromDirectoryRecursive {
        inherit (final) callPackage;
        directory = ./packages;
      };
  };

  perSystem =
    { pkgs, system, ... }:
    {
      _module.args.pkgs = import inputs.nixpkgs {
        inherit system;
        config.allowUnfree = true;
        overlays = [ self.overlays.default ];
      };

      packages.default = pkgs.rx-nvim;
    };
}
