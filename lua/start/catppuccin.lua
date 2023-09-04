local opts = {
  flavour = "mocha", -- latte, frappe, macchiato, mocha
  styles = {
    comments = { "italic" },
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    aerial = true,
    dropbar = {
      enabled = true,
      color_mode = true,
    },
    gitsigns = true,
    leap = true,
    markdown = true,
    neotree = true,
    treesitter_context = true,
    rainbow_delimiters = true,
    dap = {
      enabled = true,
      enable_ui = true,
    },
    telescope = {
      enabled = true,
      style = "nvchad",
    },
    illuminate = true,
    which_key = true,
  },
}

require("utils").lazy {
  name = "catppuccin",
  lazy = false,
  opts = opts,
  config = function() vim.cmd.colorscheme "catppuccin" end,
}
