{ inputs, ... }:
{
  imports = [ inputs.pre-commit.flakeModule ];

  perSystem = {
    pre-commit.settings.hooks = {
      treefmt.enable = true;
    };
  };
}
