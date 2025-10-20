{ lib, ... }:
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
}
