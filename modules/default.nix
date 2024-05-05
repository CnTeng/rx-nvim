{ self, ... }:
{
  flake.nixosModules.default = import ./module.nix self;
}
