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
    # code
    blink-cmp
    friendly-snippets
    nvim-dap
    nvim-dap-go
    nvim-dap-ui
    nvim-dap-virtual-text
    comment-nvim
    todo-comments-nvim
    conform-nvim
    nvim-lspconfig
    outline-nvim
    tiny-inline-diagnostic-nvim
    nvim-treesitter
    cmake-tools-nvim
    clangd_extensions-nvim
    flutter-tools-nvim
    kulala-nvim
    lazydev-nvim
    markdown-preview-nvim
    {
      name = "lspkind.nvim";
      path = lspkind-nvim;
    }

    # editor
    ultimate-autopair-nvim
    flash-nvim
    vim-illuminate
    guess-indent-nvim
    indent-blankline-nvim
    mini-nvim
    neo-tree-nvim
    nvim-lsp-file-operations
    nvim-bqf
    quicker-nvim
    neovim-session-manager
    smart-splits-nvim
    nvim-surround
    nvim-ufo

    # git
    gitsigns-nvim
    neogit
    diffview-nvim

    # tool
    copilot-vim
    copilot-status-nvim
    CopilotChat-nvim
    fcitx-vim
    fzf-lua
    fzfWrapper
    hex-nvim
    flatten-nvim
    toggleterm-nvim

    # ui
    alpha-nvim
    bamboo-nvim
    bufferline-nvim
    dressing-nvim
    dropbar-nvim
    fidget-nvim
    lualine-nvim
    statuscol-nvim
    which-key-nvim
    nvim-web-devicons
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
