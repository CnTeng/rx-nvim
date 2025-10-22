final: prev:
prev.lib.packagesFromDirectoryRecursive {
  callPackage = prev.lib.callPackageWith (
    prev.pkgs
    // {
      inherit prev;
      sources = final.callPackage ./_sources/generated.nix { };
    }
  );
  directory = ./.;
}
