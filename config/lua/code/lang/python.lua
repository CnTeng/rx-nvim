---@type LazyPluginSpec[]
return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = { pyright = {} },
    },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { python = { "black" } },
    },
  },
}
