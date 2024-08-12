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

  plugins = with vimPlugins; [
    # coding
    flutter-tools-nvim
    clangd_extensions-nvim
    markdown-preview-nvim
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
    kulala-nvim
    {
      name = "lspkind.nvim";
      path = lspkind-nvim;
    }

    # editor
    ultimate-autopair-nvim
    fzf-lua
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
    kitty-scrollback-nvim
    mini-nvim
    CopilotChat-nvim
    copilot-vim

    # git
    diffview-nvim
    gitsigns-nvim
    neogit

    # ui
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
    image-nvim

    quicker-nvim
  ];
in
{
  pluginsPath = linkFarm "lazy-plugins" (lib.concatMap mkLazyPlugin plugins);

  extraLuaPackages =
    p: with p; [
      tiktoken_core
      jsregexp
    ];
}
