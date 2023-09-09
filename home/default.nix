self: {
  lib,
  config,
  pkgs,
  ...
}:
with lib; let
  cfg = config.programs.rx-nvim;
  rx-nvim = self.packages.${pkgs.system}.default.override {
    inherit (cfg) extraPackages;
    gptSupport = cfg.gptSupport.enable;
    gptHost = cfg.gptSupport.secrets.hostPath;
    gptKey = cfg.gptSupport.secrets.keyPath;
  };
in {
  options.programs.rx-nvim = {
    enable = mkEnableOption "rx-nvim";
    defaultEditor = mkEnableOption "neovim as default editor" // {default = true;};
    extraPackages = mkOption {
      type = with types; listOf package;
      default = [];
      description = "Extra packages available to nvim.";
    };
    gptSupport = {
      enable = mkEnableOption "ChatGPT support";
      secrets = {
        hostPath = mkOption {
          type = types.str;
        };
        keyPath = mkOption {
          type = types.str;
        };
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = [rx-nvim];
    home.sessionVariables = mkIf cfg.defaultEditor {EDITOR = "nvim";};
  };
}
