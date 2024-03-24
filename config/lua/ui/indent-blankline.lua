return {
  "lukas-reineke/indent-blankline.nvim",
  event = "LazyFile",
  main = "ibl",
  opts = {
    exclude = {
      filetypes = { "alpha", "neo-tree" },
    },
  },
}
