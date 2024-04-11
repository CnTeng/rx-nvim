{ inputs, ... }:
{
  imports = [ inputs.pre-commit.flakeModule ];

  perSystem =
    {
      config,
      lib,
      pkgs,
      ...
    }:
    {
      pre-commit.settings.hooks = {
        treefmt.enable = true;
      };
    };
}
