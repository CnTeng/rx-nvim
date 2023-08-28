{
  inputs,
  self,
  ...
}: {
  flake.homeModules.default = import ../home self;

  imports = [./devshell.nix ./treefmt.nix];

  perSystem = {
    pkgs,
    system,
    config,
    ...
  }: {
    _module.args.pkgs = import inputs.nixpkgs {
      inherit system;
      overlays =
        map (n: inputs.${n}.overlays.default) ["neovim-nightly"];
    };

    packages.default = pkgs.callPackage ../package {};
  };
}
