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
    gCalendar = cfg.gCalendar.enable;
    gCalendarCred = cfg.gCalendar.CredPath;
  };
in {
  options.programs.rx-nvim = {
    enable = mkEnableOption "rx-nvim";
    languages = mapAttrs (_: doc: mkEnableOption (mkDoc doc) // {default = true;}) {
      nix = "Nix support";
      lua = "Lua support";
      python = "Python support";
    };
    gCalendar = {
      enable = mkEnableOption "Google calendar";
      CredPath = mkOption {
        type = with types; nullOr path;
        default = null;
      };
    };
  };

  config = mkIf cfg.enable {
    home.packages = [rx-nvim];
  };
}
