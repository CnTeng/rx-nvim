return {
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
}
