{
  lib,
  stdenv,
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  writeTextFile,
  ripgrep,
  jq,
  fd,
  vimPlugins,
  efm-langserver,
  extraPackages ? [],
  gptSupport ? false,
  gptSecrets ? "",
}:
with lib; let
  inherit (import ./lib.nix lib vimPlugins) getPluginName getPluginPkg mkInitFile;

  startPlugins = getPluginName ../lua/start;
  optPlugins = getPluginName ../lua/opt;

  configDir = stdenv.mkDerivation {
    name = "nvim-config";
    src = ../lua;
    installPhase = ''
      mkdir -p $out/lua
      mv ./* $out/lua
    '';
  };

  initFile = writeTextFile {
    name = "init.lua";
    text =
      ''
        vim.loader.enable()
        vim.opt.rtp:append("${configDir}")
        require "core"
      ''
      + optionalString gptSupport "vim.g.gptsupport = true\n"
      + optionalString gptSupport "vim.g.gptsecrets = \"${gptSecrets}\"\n"
      + mkInitFile "start" startPlugins
      + mkInitFile "opt" optPlugins;
  };

  defaultPlugins = with vimPlugins; [
    nvim-web-devicons
    plenary-nvim
    fzfWrapper
    efmls-configs-nvim
  ];

  treesitterPlugins = with vimPlugins; [
    nvim-treesitter.withAllGrammars
    nvim-treesitter-context
  ];

  cmpPlugins = with vimPlugins; [
    cmp-nvim-lsp
    cmp_luasnip
    cmp-buffer
    cmp-path
    cmp-cmdline
    lspkind-nvim
  ];

  telescopePlugins = with vimPlugins; [
    telescope-undo-nvim
    telescope-fzf-native-nvim
  ];

  binPath = makeBinPath ([ripgrep fd jq efm-langserver] ++ extraPackages);

  neovimConfig =
    neovimUtils.makeNeovimConfig {
      customRC = "luafile ${initFile}";
    }
    // {
      wrapperArgs = escapeShellArgs ["--suffix" "PATH" ":" "${binPath}"];
      packpathDirs.myNeovimPackages = {
        opt = getPluginPkg optPlugins;
        start =
          getPluginPkg startPlugins
          ++ defaultPlugins
          ++ cmpPlugins
          ++ treesitterPlugins
          ++ telescopePlugins;
      };
    };
in
  wrapNeovimUnstable neovim-unwrapped neovimConfig
