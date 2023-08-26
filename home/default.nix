self: {
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.rx-nvim;
  rx-nvim = self.packages.${pkgs.system}.default.override {
    nixSupport = cfg.languages.nix;
    luaSupport = cfg.languages.lua;
    pythonSupport = cfg.languages.python;
    inherit (cfg) extraPackages;
    gptSupport = cfg.gptSupport.enable;
    gptSecrets = cfg.gptSupport.secretsPath;
  };
in {
  options.programs.rx-nvim = {
    enable = mkEnableOption "rx-nvim";
    defaultEditor = mkEnableOption "neovim as default editor" // {default = true;};
    languages = mapAttrs (_: doc: mkEnableOption (mkDoc doc) // {default = true;}) {
      nix = "Nix support";
      lua = "Lua support";
      python = "Python support";
    };
    extraPackages = mkOption {
      type = with types; listOf package;
      default = [];
      description = "Extra packages available to nvim.";
    };
    gptSupport = {
      enable = mkEnableOption "ChatGPT support";
      secretsPath = mkOption {
        type = types.str;
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = [rx-nvim];
    home.sessionVariables = mkIf cfg.defaultEditor {EDITOR = "nvim";};
  };
}
