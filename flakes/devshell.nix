{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          nvfetcher
          rx-nvim
        ];

        shellHook = config.pre-commit.installationScript;
      };
    };
}
