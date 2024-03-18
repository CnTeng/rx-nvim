{
  perSystem =
    { config, pkgs, ... }:
    {
      devShells.default = pkgs.mkShell {
        packages = with pkgs; [
          lua-language-server
          stylua
          nil
          nixfmt-rfc-style
          prettierd
          nodePackages.bash-language-server
          shfmt
          nvfetcher
        ];

        inputsFrom = [ config.packages.default ];

        shellHook = config.pre-commit.installationScript;
      };
    };
}
