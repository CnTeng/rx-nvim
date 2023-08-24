{inputs, ...}: {
  imports = [inputs.devshell.flakeModule];

  perSystem = {config, ...}: {
    devshells.default = {
      env = [
        {
          name = "OPENAI_API_HOST";
          value = "api.aikey.one";
        }
        {
          name = "OPENAI_API_KEY";
          value = "sk-IwAHD4ZgjZQAdbBO8787F5F387854d719d174d63Ad6bCb04";
        }
      ];
      packages = [config.packages.default];
    };
  };
}
