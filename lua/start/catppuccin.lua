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
    ts_rainbow2 = true,
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

require("utils.plugin").load { name = "catppuccin", opts = opts }

vim.cmd.colorscheme "catppuccin"