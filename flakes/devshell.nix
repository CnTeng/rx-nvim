{ inputs, ... }: {
  imports = [ inputs.devshell.flakeModule ];

  perSystem = { config, pkgs, ... }: {
    devshells.default.packages = with pkgs;
      [ lua-language-server stylua nil nixfmt prettierd ]
      ++ [ config.packages.default ];
  };
}
