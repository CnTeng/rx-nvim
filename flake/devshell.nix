{inputs, ...}: {
  imports = [inputs.devshell.flakeModule];

  perSystem = {
    config,
    pkgs,
    ...
  }: {
    devshells.default.packages = with pkgs;
      [ lua-language-server stylua ]
      ++ [config.packages.default];
  };
}
