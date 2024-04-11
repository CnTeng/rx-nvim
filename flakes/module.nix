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

  languagesPkgs = with pkgs; [
    # C/C++
    clang-tools
    cmake-language-server
    cmake-format

    # Go
    gopls

    # Lua
    lua-language-server
    stylua

    # Nix
    nil
    nixfmt-rfc-style

    # Python
    nodePackages.pyright
    black

    # Rust
    rust-analyzer

    # Shell
    nodePackages.bash-language-server
    shfmt

    # Terraform
    terraform-ls

    # Other
    nodePackages.prettier
    xmlformat
    taplo
  ];
in
{
  options.programs.rx-nvim = {
    enable = mkEnableOption "rx-nvim";

    package = mkPackageOption self.packages.${pkgs.system} "rx-nvim" { };

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
  };
}
