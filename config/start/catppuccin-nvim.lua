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
    mini = true,
    indent_blankline = {
      enabled = true,
      colored_indent_levels = true,
    },
    leap = true,
    markdown = true,
    nvimtree = true,
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
    telescope = true,
    illuminate = true,
    gitsigns = true,
    which_key = true,
  },
}

require("core.utils").load_plugin { name = "catppuccin", opts = opts }

-- vim.cmd.colorscheme "catppuccin"
