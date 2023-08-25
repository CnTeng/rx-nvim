local opts = {
  highlight = {
    enable = true,
    additional_vim_regex_highlighting = { "markdown", "org" },
  },
  incremental_selection = { enable = true },
  indent = { enable = false },
  rainbow = {
    enable = true,
    disable = { "html" },
  },
  autotag = { enable = true },
  context_commentstring = {
    enable = true,
    enable_autocmd = false,
  },
}

require("utils.plugin").load {
  name = "nvim-treesitter.configs",
  opts = opts,
}
