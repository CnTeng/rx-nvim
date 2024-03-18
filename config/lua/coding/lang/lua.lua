return {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "folke/neodev.nvim", opts = {} },
    opts = {
      servers = {
        lua_ls = {
          settings = {
            Lua = {
              workspace = { checkThirdParty = false },
              format = { enable = false },
              completion = { callSnippet = "Replace" },
              hint = { enable = true },
            },
          },
        },
      },
    },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { lua = { "stylua" } },
    },
  },
}
