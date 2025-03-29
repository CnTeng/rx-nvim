---@type LazyPluginSpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    statuscolumn = {
      enabled = true,
      left = { "mark", "fold" },
      right = { "sign", "git" },
      folds = { open = true },
    },
  },
}
