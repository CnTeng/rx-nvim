---@type LazyPluginSpec
return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    input = { enabled = true },
    statuscolumn = {
      enabled = true,
      left = { "mark", "fold" },
      right = { "sign", "git" },
      folds = { open = true },
    },
    styles = {
      input = {
        title_pos = "left",
        relative = "cursor",
        row = -3,
        col = 0,
        width = 30,
      },
    },
  },
}
