{
  inputs,
  lib,
  self,
  ...
}:
{
  flake.overlays.default =
    final: prev:
    lib.packagesFromDirectoryRecursive {
      callPackage = lib.callPackageWith (
        prev.pkgs
        // {
          inherit prev;
          sources = final.callPackage ./_sources/generated.nix { };
        }
      );
      directory = ./.;
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
