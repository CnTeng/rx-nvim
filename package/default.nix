{
  lib,
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  writeTextFile,
  ripgrep,
  fd,
  vimPlugins,
  extraPackages ? [],
  gptSupport ? false,
  gptHost ? "",
  gptKey ? "",
}:
with lib; let
  inherit (import ./lib.nix lib vimPlugins) getPluginName getPluginPkg mkInitFile;

  startPlugins = getPluginName ../lua/start;
  optPlugins = getPluginName ../lua/opt;

  initFile = writeTextFile {
    name = "init.lua";
    text =
      ''
        vim.loader.enable()
        vim.opt.rtp:append("${../.}")
        require "core"
      ''
      + optionalString gptSupport "vim.g.gptsupport = true\n"
      + optionalString gptSupport "vim.g.gpthost = \"${gptHost}\"\n"
      + optionalString gptSupport "vim.g.gptkey= \"${gptKey}\"\n"
      + mkInitFile "start" startPlugins
      + mkInitFile "opt" optPlugins;
  };

  defaultPlugins = with vimPlugins; [fzfWrapper];

  treesitterPlugins = with vimPlugins; [nvim-treesitter.withAllGrammars];

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

  binPath = makeBinPath ([ripgrep fd] ++ extraPackages);

  neovimConfig =
    neovimUtils.makeNeovimConfig {customRC = "luafile ${initFile}";}
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
