local opts = {
  exclude = {
    filetypes = { "alpha", "neo-tree" },
  },
}

require("utils").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pack = "indent-blankline.nvim",
  name = "ibl",
  opts = opts,
}
