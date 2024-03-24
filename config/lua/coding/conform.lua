return {
  "stevearc/conform.nvim",
  event = "LazyFile",
  init = function() vim.o.formatexpr = "v:lua.require'conform'.formatexpr()" end,
  keys = {
    {
      mode = { "n", "v" },
      "<leader>lf",
      function() require("conform").format { lsp_fallback = true } end,
      desc = "Format code",
    },
  },
  opts = {
    formatters_by_ft = {
      yaml = { "prettier" },
      xml = { "xmlformat" },
      toml = { "taplo" },
    },
    format_on_save = {
      timeout_ms = 500,
      lsp_fallback = true,
    },
  },
}
