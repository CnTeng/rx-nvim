{ self, ... }:
{
  flake.nixosModules.default = {
    nixpkgs.overlays = [ self.overlays.default ];

    imports = [ ./module.nix ];
  };
}
