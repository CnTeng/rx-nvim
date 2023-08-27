local opts = {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown" },
  },
  incremental_selection = { enable = true },
  indent = { enable = true },
}

require("utils.plugin").load {
  name = "nvim-treesitter.configs",
  opts = opts,
}
