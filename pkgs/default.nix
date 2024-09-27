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
      in
      {
        vimPlugins = prev.vimPlugins.extend (
          _: prev': {
            copilot-status-nvim = mkPackage "copilot-status-nvim" "copilot-status.nvim";
            kitty-scrollback-nvim = mkPackage "kitty-scrollback-nvim" "kitty-scrollback.nvim";
            kulala-nvim = mkPackage "kulala-nvim" "kulala.nvim";
            neovim-session-manager = mkPackage "neovim-session-manager" "neovim-session-manager";
            quicker-nvim = mkPackage "quicker-nvim" "quicker.nvim";
          }
        );
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
