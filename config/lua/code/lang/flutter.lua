---@type LazyPluginSpec
return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  ft = "dart",
  opts = {
    lsp = {
      color = { enabled = true },
    },
  },
}
