{inputs, ...}: {
  imports = [inputs.treefmt.flakeModule];

  perSystem = {...}: {
    treefmt = {
      projectRootFile = "flake.nix";
      programs = {
        alejandra.enable = true;
        prettier.enable = true;
        stylua.enable = true;
      };
    };
  };
}