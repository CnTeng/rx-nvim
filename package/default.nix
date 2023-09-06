{
  lib,
  wrapNeovimUnstable,
  neovim-unwrapped,
  neovimUtils,
  writeTextFile,
  ripgrep,
  jq,
  fd,
  vimPlugins,
  extraPackages ? [],
  gptSupport ? false,
  gptSecrets ? "",
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
      + optionalString gptSupport "vim.g.gptsecrets = \"${gptSecrets}\"\n"
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

  binPath = makeBinPath ([ripgrep fd jq] ++ extraPackages);

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
