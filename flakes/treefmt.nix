{ inputs, ... }:
{
  imports = [ inputs.treefmt.flakeModule ];

  perSystem =
    { pkgs, ... }:
    {
      treefmt = {
        projectRootFile = "flake.nix";

        programs = {
          nixfmt.enable = true;
          prettier.enable = true;
          stylua.enable = true;
          taplo.enable = true;
        };

        settings.global.excludes = [ "pkgs/_sources/*" ];
      };
    };
}
