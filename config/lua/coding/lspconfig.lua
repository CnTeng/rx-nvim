return {
  "neovim/nvim-lspconfig",
  event = "LazyFile",
  dependencies = { "hrsh7th/cmp-nvim-lsp" },
  keys = {
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP info" },
  },
  opts = {
    diagnostics = {
      virtual_text = { spacing = 2, prefix = "●" },
      signs = {
        text = {
          [vim.diagnostic.severity.ERROR] = "",
          [vim.diagnostic.severity.WARN] = "",
          [vim.diagnostic.severity.INFO] = "",
          [vim.diagnostic.severity.HINT] = "",
        },
      },
      update_in_insert = false,
      severity_sort = true,
    },
    servers = {},
  },
  config = function(_, opts)
    vim.diagnostic.config(opts.diagnostics)

    require("utils").setup_lspconfig(opts.servers)
  end,
}
