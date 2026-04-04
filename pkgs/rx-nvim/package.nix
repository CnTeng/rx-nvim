{
  vimPlugins,
  wrapNeovimUnstable,
  neovim-unwrapped,
  extraConfig ? "",
}:
let
  configPath = ../../config;
  mkOptional = plugin: {
    inherit plugin;
    optional = true;
  };
in
wrapNeovimUnstable neovim-unwrapped {
  withPython3 = true;
  withNodeJs = true;
  plugins =
    with vimPlugins;
    [
      lz-n
      nvim-treesitter.withAllGrammars
    ]
    ++ map mkOptional [
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

      # editor
      ultimate-autopair-nvim
      vim-illuminate
      guess-indent-nvim
      indent-blankline-nvim
      mini-nvim
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
      CopilotChat-nvim
      fcitx-vim
      fzf-lua
      fzf-wrapper
      flatten-nvim
      toggleterm-nvim

      # ui
      alpha-nvim
      bamboo-nvim
      bufferline-nvim
      dropbar-nvim
      fidget-nvim
      nvim-web-devicons
      lualine-nvim
      neo-tree-nvim
      which-key-nvim
    ];
  luaRcContent = ''
    vim.opt.rtp:prepend("${configPath}")
    dofile("${configPath}/init.lua")

    ${extraConfig}
  '';
}
