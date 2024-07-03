{
  lib,
  linkFarm,
  vimPlugins,
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

  codingPlugins = with vimPlugins; [
    flutter-tools-nvim
    clangd_extensions-nvim
    markdown-preview-nvim
    neogit
    nvim-treesitter
    conform-nvim
    cmake-tools-nvim
    comment-nvim
    outline-nvim
    nvim-cmp
    cmp-nvim-lsp
    cmp-buffer
    cmp-path
    cmp-cmdline
    cmp-emoji
    copilot-status-nvim
    nvim-snippets
    friendly-snippets
    nvim-lspconfig
    luvit-meta
    lazydev-nvim
    {
      name = "lspkind.nvim";
      path = lspkind-nvim;
    }
  ];

  uiPlugins = with vimPlugins; [
    dropbar-nvim
    alpha-nvim
    bamboo-nvim
    lualine-nvim
    fzfWrapper
    flatten-nvim
    bufferline-nvim
    indent-blankline-nvim
    nvim-bqf
    dressing-nvim
    fidget-nvim
    which-key-nvim
    statuscol-nvim
    toggleterm-nvim
    precognition-nvim
    image-nvim
  ];

  editorPlugins = with vimPlugins; [
    ultimate-autopair-nvim
    fzf-lua
    gitsigns-nvim
    glance-nvim
    fcitx-vim
    todo-comments-nvim
    neo-tree-nvim
    vim-illuminate
    nvim-surround
    flash-nvim
    nvim-ufo
    guess-indent-nvim
    smart-splits-nvim
    mini-nvim
    CopilotChat-nvim
    copilot-vim
  ];

  plugins = codingPlugins ++ editorPlugins ++ uiPlugins;
in
{
  pluginsPath = linkFarm "lazy-plugins" (lib.concatMap mkLazyPlugin plugins);

  extraLuaPackages =
    p: with p; [
      tiktoken_core
      jsregexp
    ];
}
