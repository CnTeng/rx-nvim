return {
  {
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    opts = function()
      return {
        lsp = {
          color = { enabled = true },
          on_attach = require("utils.lsp").on_attach(false),
        },
      }
    end,
  },
}
