{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [ nvfetcher ];

        inputsFrom = [ config.packages.default ];

        shellHook = config.pre-commit.installationScript;
      };
    };
}
