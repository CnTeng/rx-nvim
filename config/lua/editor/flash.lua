---@type LazyPluginSpec
return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = function()
    local flash = require("flash")
    return {
      { mode = { "n", "x", "o" }, "s", flash.jump, desc = "Flash" },
      { mode = { "n", "x", "o" }, "S", flash.treesitter, desc = "Flash Treesitter" },
    }
  end,
  opts = {
    modes = {
      treesitter = {
        label = { rainbow = { enabled = true } },
      },
    },
  },
}
