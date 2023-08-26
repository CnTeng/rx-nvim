{inputs, ...}: {
  imports = [inputs.devshell.flakeModule];

  perSystem = {config, ...}: {
    devshells.default.packages = [config.packages.default];
  };
}
