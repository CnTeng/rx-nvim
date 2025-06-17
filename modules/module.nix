{
  lib,
  config,
  pkgs,
  ...
}:
let
  cfg = config.programs.rx-nvim;

  extraPkgs = with pkgs; [
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

    # Python
    pyright
    black

    # Shell
    bash-language-server
    shfmt

    # SQL
    sql-formatter

    # TOML
    taplo

    # TypeScript/JavaScript
    vtsls

    # YAML
    yaml-language-server

    # Other
    libxml2
    prettier
  ];
in
{
  options.programs.rx-nvim = {
    enable = lib.mkEnableOption "rx-nvim";

    package = lib.mkPackageOption pkgs "rx-nvim" { };

    finalPackage = lib.mkOption {
      type = lib.types.package;
      visible = false;
      readOnly = true;
      description = "Resulting customized neovim package.";
    };

    defaultEditor = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Whether to configure {command}`nvim` as the default
        editor using the {env}`EDITOR` environment variable.
      '';
    };

    withExtraPackages = lib.mkOption {
      type = lib.types.bool;
      default = false;
      description = ''
        Whether to install extra packages.
      '';
    };

    extraConfig = lib.mkOption {
      type = lib.types.lines;
      default = "";
      description = "Extra configuration appended to nvim.";
    };
  };

  config = lib.mkIf cfg.enable {
    programs.rx-nvim.finalPackage = cfg.package.override { inherit (cfg) extraConfig; };

    environment.systemPackages = [
      cfg.finalPackage
      pkgs.nil
      pkgs.nixfmt-rfc-style
    ] ++ (lib.optionals cfg.withExtraPackages extraPkgs);

    environment.variables.EDITOR = lib.mkIf cfg.defaultEditor "nvim";

    environment.pathsToLink = [ "/share/nvim" ];
  };
}
