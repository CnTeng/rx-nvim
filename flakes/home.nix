self:
{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.programs.rx-nvim;
  inherit (cfg) languages;

  rx-nvim = self.packages.${pkgs.system}.default.override { inherit (cfg) extraConfig; };

  cppPkgs = with pkgs; [
    clang-tools
    cmake-language-server
    cmake-format
  ];

  goPkgs = with pkgs; [ go ];

  luaPkgs = with pkgs; [
    lua-language-server
    stylua
  ];

  nixPkgs = with pkgs; [
    nil
    nixfmt-rfc-style
  ];

  pythonPkgs = with pkgs; [
    nodePackages.pyright
    black
  ];

  shellPkgs = with pkgs; [
    nodePackages.bash-language-server
    shfmt
  ];
in
{
  options.programs.rx-nvim = {
    enable = mkEnableOption "rx-nvim";
    defaultEditor = mkEnableOption "neovim as default editor" // {
      default = true;
    };
    languages = {
      fullSupport = mkEnableOption "full languages support";
      cppSupport = mkEnableOption "C/C++ support";
      goSupport = mkEnableOption "Go support";
      luaSupport = mkEnableOption "Lua support";
      nixSupport = mkEnableOption "Nix support";
      pythonSupport = mkEnableOption "Python support";
      shellSupport = mkEnableOption "Shell support";
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
    programs.rx-nvim.languages = mkIf languages.fullSupport {
      cppSupport = true;
      goSupport = true;
      luaSupport = true;
      nixSupport = true;
      pythonSupport = true;
      shellSupport = true;
    };

    home.packages =
      [ rx-nvim ]
      ++ optionals languages.cppSupport cppPkgs
      ++ optionals languages.goSupport goPkgs
      ++ optionals languages.luaSupport luaPkgs
      ++ optionals languages.nixSupport nixPkgs
      ++ optionals languages.PythonSupport pythonPkgs
      ++ optionals languages.shellSupport shellPkgs
      ++ extraPackages;

    home.sessionVariables = mkIf cfg.defaultEditor { EDITOR = "nvim"; };

    xdg.desktopEntries.nvim-kitty = {
      exec = getExe pkgs.kitty + " -e nvim %F";
      icon = "nvim";
      comment = "Edit text files";
      terminal = false;
      name = "Neovim Kitty";
      genericName = "Text Editor";
      categories = [
        "Utility"
        "TextEditor"
      ];
    };
  };
}
