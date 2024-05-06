{
  perSystem =
    { pkgs, ... }:
    {
      packages.default = pkgs.callPackage ./rx-nvim.nix { };
    };
}
