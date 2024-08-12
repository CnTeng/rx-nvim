return {
  ---@type LazyPluginSpec
  {
    "nmac427/guess-indent.nvim",
    event = "LazyFile",
    opts = {},
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    event = "LazyFile",
    main = "ibl",
    opts = {
      indent = { char = "▏" },
      scope = {
        char = "▎",
        show_start = false,
        show_end = false,
      },
      exclude = {
        filetypes = { "alpha", "neo-tree" },
      },
    },
  },
}
