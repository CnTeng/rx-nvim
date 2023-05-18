local opts = {
  flavour = "macchiato", -- latte, frappe, macchiato, mocha
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
    fidget = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    leap = true,
    markdown = true,
    neotree = true,
    cmp = true,
    coc_nvim = true,
    dap = {
      enabled = true,
      enable_ui = true,
    },
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = { "italic" },
        hints = { "italic" },
        warnings = { "italic" },
        information = { "italic" },
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
    treesitter_context = true,
    treesitter = true,
    telescope = true,
    illuminate = true,
    ts_rainbow2 = true,
    gitgutter = true,
    which_key = true,
  },
}

require("core.utils").load_plugin { name = "catppuccin", opts = opts }

vim.cmd.colorscheme "catppuccin"
