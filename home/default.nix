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
  };
in {
  options.programs.rx-nvim = {
    enable = mkEnableOption "rx-nvim";
    languages = mapAttrs (_: doc: mkEnableOption (mkDoc doc) // {default = true;}) {
      nix = "Nix support";
      lua = "Lua support";
      python = "Python support";
    };
  };

  config = mkIf cfg.enable {home.packages = [rx-nvim];};
}
