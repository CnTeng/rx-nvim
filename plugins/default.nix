{
  lib,
  linkFarm,
  callPackage,
  vimPlugins,
  fswatch,
  ripgrep,
  fd,
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

  extraPlugins = callPackage ./extra.nix { };

  codingPlugins =
    with vimPlugins;
    with extraPlugins;
    [
      clangd_extensions-nvim
      markdown-preview-nvim
      neogit
      nvim-treesitter
      conform-nvim
      comment-nvim
      outline-nvim
      nvim-cmp
      cmp-nvim-lsp
      cmp_luasnip
      cmp-buffer
      cmp-path
      cmp-cmdline
      friendly-snippets
      nvim-lspconfig
      neodev-nvim
      {
        name = "LuaSnip";
        path = luasnip;
      }
      {
        name = "lspkind.nvim";
        path = lspkind-nvim;
      }
    ];

  uiPlugins =
    with vimPlugins;
    with extraPlugins;
    [
      dropbar-nvim
      alpha-nvim
      bamboo-nvim
      lualine-nvim
      fzfWrapper
      bufferline-nvim
      indent-blankline-nvim
      nvim-bqf
      dressing-nvim
      fidget-nvim
      which-key-nvim
      statuscol-nvim
    ];

  editorPlugins =
    with vimPlugins;
    with extraPlugins;
    [
      nvim-autopairs
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
      # gp-nvim
    ];

  plugins = codingPlugins ++ editorPlugins ++ uiPlugins;
in
{
  pluginsPath = linkFarm "lazy-plugins" (lib.concatMap mkLazyPlugin plugins);

  binPath = lib.makeBinPath [
    fswatch
    ripgrep
    fd
  ];
}
