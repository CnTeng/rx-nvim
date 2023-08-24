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

require("utils.plugin").load {
  name = "indent_blankline",
  opts = opts,
}
