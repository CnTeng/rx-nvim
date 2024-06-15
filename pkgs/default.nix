{
  inputs,
  lib,
  self,
  ...
}:
{
  flake.overlays = {
    default = lib.composeManyExtensions ([
      self.overlays.rx-nvim
      self.overlays.plugins
    ]);

    rx-nvim = final: prev: { rx-nvim = final.callPackage ../package { }; };

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
          CopilotChat-nvim = mkOverride "CopilotChat-nvim";

          copilot-status-nvim = mkPackage "copilot-status-nvim" "copilot-status.nvim";
          lazydev-nvim = mkPackage "lazydev-nvim" "lazydev.nvim";
          luvit-meta = mkPackage "luvit-meta" "luvit-meta";
        };
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
