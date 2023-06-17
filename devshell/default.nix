{ inputs, ... }: {
  imports = map (n: inputs.${n}.flakeModule) [ "devshell" "treefmt-nix" ];

  perSystem = { pkgs, system, config, ... }: {
    _module.args.pkgs = import inputs.nixpkgs { inherit system; };

    legacyPackages = pkgs;

    devshells.default.packages = [ config.packages.default ];

    treefmt = {
      projectRootFile = "flake.nix";
      programs = {
        nixfmt.enable = true;
        prettier.enable = true;
        shfmt.enable = true;
        stylua.enable = true;
      };
    };
  };
}
