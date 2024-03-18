return {
  "lukas-reineke/indent-blankline.nvim",
  event = { "BufReadPre", "BufNewFile" },
  main = "ibl",
  opts = {
    exclude = {
      filetypes = { "alpha", "neo-tree" },
    },
  },
}
