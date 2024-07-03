{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          nvfetcher
          rx-nvim
          config.treefmt.build.wrapper
        ];

        shellHook = config.pre-commit.installationScript;
      };
    };
}
