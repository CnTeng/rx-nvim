return {
  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = { uv = "luvit-meta/library" },
      enabled = function(root_dir) return vim.uv.fs_stat(root_dir .. "/config/lua") and true or false end,
    },
  },
  { "Bilal2453/luvit-meta", lazy = true },
  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts) table.insert(opts.sources, { name = "lazydev", group_index = 0 }) end,
  },
  {
    "neovim/nvim-lspconfig",
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
