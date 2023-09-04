local opts = {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
  },
  incremental_selection = { enable = true },
  indent = { enable = true },
}

require("utils.plugin").lazy {
  name = "nvim-treesitter.configs",
  lazy = false,
  opts = opts,
}
