---@type LazyPluginSpec
return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  opts = {
    lsp = {
      color = { enabled = true },
    },
  },
}
