local opts = {
  char = "▎",
  context_char = "▎",
  use_treesitter = true,
  filetype_exclude = {
    "lspinfo",
    "checkhealth",
    "help",
    "man",
    "alpha",
    "neo-tree",
  },
  show_current_context = true,
}

require("utils").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pack = "indent-blankline.nvim",
  name = "indent_blankline",
  opts = opts,
}
