{
  description = "NixOS Configuration";

  nixConfig = {
    extra-substituters = ["https://cache.snakepi.xyz"];
    extra-trusted-public-keys = [
      "cache.snakepi.xyz-1:CnMDci45ncAX/kR+3RyxeRLYa+9cFHH+LrOhVEiE1ss="
    ];
  };

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";

    flake-parts.url = "github:hercules-ci/flake-parts";

    devshell = {
      url = "github:numtide/devshell";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    treefmt-nix = {
      url = "github:numtide/treefmt-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs @ {
    self,
    flake-parts,
    ...
  }:
    flake-parts.lib.mkFlake {inherit inputs;} {
      systems = ["x86_64-linux"];

      imports = [./devshell];
      flake.homeModules.default = import ./home self;

      perSystem = {
        pkgs,
        lib,
        config,
        ...
      }: {
        packages.default = pkgs.callPackage ./package {};
      };
    };
}
