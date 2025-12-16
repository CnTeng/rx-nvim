{
  lib,
  linkFarm,
  vimPlugins,
  python3Packages,
  lynx,
  ...
}:
let
  mkLazyPlugin =
    plugin:
    let
      mkEntry = p: {
        name = lib.getName p;
        path = p;
      };
      dependencies = lib.optionals (plugin ? dependencies) (
        lib.concatMap mkLazyPlugin plugin.dependencies
      );
    in
    if lib.isDerivation plugin then [ (mkEntry plugin) ] ++ dependencies else [ plugin ];

  mkRuntimeDeps =
    plugins:
    let
      op = acc: plugin: acc ++ plugin.runtimeDeps or [ ];
    in
    lib.foldl' op [ ] plugins;

  plugins = with vimPlugins; [
    # code
    blink-cmp
    friendly-snippets
    comment-nvim
    conform-nvim
    nvim-dap
    nvim-dap-view
    nvim-dap-virtual-text
    nvim-dap-go
    nvim-lspconfig
    outline-nvim
    lazydev-nvim
    SchemaStore-nvim
    render-markdown-nvim
    markdown-preview-nvim
    nvim-treesitter
    lspkind-nvim

    # editor
    ultimate-autopair-nvim
    vim-illuminate
    guess-indent-nvim
    indent-blankline-nvim
    mini-nvim
    neo-tree-nvim
    nvim-bqf
    quicker-nvim
    auto-session
    smart-splits-nvim
    snacks-nvim
    nvim-surround

    # git
    vim-fugitive
    vim-flog
    gitsigns-nvim

    # tool
    vim-plugin-AnsiEsc
    copilot-vim
    copilot-status-nvim
    CopilotChat-nvim
    fcitx-vim
    fzf-lua
    fzfWrapper
    flatten-nvim
    toggleterm-nvim

    # ui
    alpha-nvim
    bamboo-nvim
    bufferline-nvim
    dropbar-nvim
    fidget-nvim
    lualine-nvim
    which-key-nvim
    nvim-web-devicons
  ];
in
{
  pluginsPath = linkFarm "lazy-plugins" (lib.concatMap mkLazyPlugin plugins);
  runtimeDeps = mkRuntimeDeps plugins ++ [
    python3Packages.pylatexenc
    lynx
  ];
  extraLuaPackages = p: with p; [ tiktoken_core ];
}
