{
  lib,
  config,
  pkgs,
  ...
}:
with lib;
let
  cfg = config.programs.rx-nvim;

  languagesPkgs = with pkgs; [
    # C/C++
    clang-tools
    cmake-language-server
    cmake-format
    lldb
    gdb

    # Dockerfile
    dockerfile-language-server-nodejs

    # Go
    go
    gopls
    gofumpt
    golangci-lint
    golangci-lint-langserver
    delve

    # JSON
    vscode-langservers-extracted
    jq

    # Lua
    lua-language-server
    stylua

    # Nix
    nil
    nixfmt-rfc-style

    # Python
    pyright
    black

    # Rust
    rust-analyzer
    rustfmt

    # Shell
    bash-language-server
    shfmt

    # SQL
    sql-formatter

    # TOML
    taplo

    # YAML
    yaml-language-server

    # Other
    libxml2
    nodePackages.prettier
  ];
in
{
  options.programs.rx-nvim = {
    enable = mkEnableOption "rx-nvim";

    package = mkPackageOption pkgs "rx-nvim" { };

    finalPackage = mkOption {
      type = types.package;
      visible = false;
      readOnly = true;
      description = mdDoc "Resulting customized neovim package.";
    };

    defaultEditor = mkEnableOption "neovim as default editor" // {
      default = true;
    };

    extraConfig = mkOption {
      type = types.lines;
      default = "";
      description = "Extra configuration appended to nvim.";
    };
  };

  config = mkIf cfg.enable {
    programs.rx-nvim.finalPackage = cfg.package.override { inherit (cfg) extraConfig; };

    environment.systemPackages = [ cfg.finalPackage ] ++ languagesPkgs;

    environment.variables.EDITOR = mkIf cfg.defaultEditor "nvim";

    environment.pathsToLink = [ "/share/nvim" ];
  };
}
