{inputs, ...}: {
  imports = [inputs.devshell.flakeModule];

  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devshells.default.packages = with pkgs;
      [
        nil
        alejandra
        lua-language-server
        stylua
        dprint
      ]
      ++ [config.packages.default];
  };
}
