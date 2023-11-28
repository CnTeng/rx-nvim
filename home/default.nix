self:
{ lib, config, pkgs, ... }:
with lib;
let
  cfg = config.programs.rx-nvim;

  rx-nvim = self.packages.${pkgs.system}.default.override {
    inherit (cfg) extraPackages extraConfig;
  };
in {
  options.programs.rx-nvim = {
    enable = mkEnableOption "rx-nvim";
    defaultEditor = mkEnableOption "neovim as default editor" // {
      default = true;
    };
    extraPackages = mkOption {
      type = with types; listOf package;
      default = [ ];
      description = "Extra packages available to nvim.";
    };
    extraConfig = mkOption {
      type = types.lines;
      default = "";
      description = "Extra configuration appended to nvim.";
    };
  };

  config = mkIf cfg.enable {
    home.packages = [ rx-nvim ];
    home.sessionVariables = mkIf cfg.defaultEditor { EDITOR = "nvim"; };

    xdg.desktopEntries.nvim-kitty = {
      exec = getExe pkgs.kitty + " -e nvim %F";
      icon = "nvim";
      comment = "Edit text files";
      terminal = false;
      name = "Neovim Kitty";
      genericName = "Text Editor";
      categories = [ "Utility" "TextEditor" ];
    };
  };
}
