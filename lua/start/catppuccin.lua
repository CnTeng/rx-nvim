local opts = {
  flavour = "mocha",
  styles = { conditionals = {} },
  integrations = {
    dropbar = { enabled = true, color_mode = true },
    fidget = true,
    neotree = true,
    treesitter_context = true,
    ufo = true,
    telescope = { style = "nvchad" },
    which_key = true,
  },
}

require("utils").lazy {
  name = "catppuccin",
  lazy = false,
  opts = opts,
  config = function() vim.cmd.colorscheme "catppuccin" end,
}
