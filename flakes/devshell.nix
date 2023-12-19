{ ... }: {
  perSystem = { config, pkgs, ... }: {
    devShells.default = pkgs.mkShell {
      packages = with pkgs; [ lua-language-server stylua nil nixfmt prettierd ];

      inputsFrom = [ config.packages.default ];

      shellHook = config.pre-commit.installationScript;
    };
  };
}
