{
  inputs,
  lib,
  self,
  ...
}:
{
  flake.overlays.default =
    final: prev:
    let
      sources = final.callPackage ./_sources/generated.nix { };
      mkPlugin = src: pname: final.vimUtils.buildVimPlugin sources.${src} // { inherit pname; };
    in
    lib.packagesFromDirectoryRecursive {
      callPackage = lib.callPackageWith (prev.pkgs // { inherit prev mkPlugin; });
      directory = ./packages;
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
