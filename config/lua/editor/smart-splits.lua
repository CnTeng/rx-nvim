---@type LazyPluginSpec
return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  keys = function()
    local smart_splits = require("smart-splits")
    return {
      { mode = { "n", "t" }, "<C-h>", smart_splits.move_cursor_left, desc = "Move cursor left" },
      { mode = { "n", "t" }, "<C-j>", smart_splits.move_cursor_down, desc = "Move cursor down" },
      { mode = { "n", "t" }, "<C-k>", smart_splits.move_cursor_up, desc = "Move cursor up" },
      { mode = { "n", "t" }, "<C-l>", smart_splits.move_cursor_right, desc = "Move cursor right" },

      { mode = { "n", "t" }, "<C-w>h", smart_splits.swap_buf_left, desc = "Swap window left" },
      { mode = { "n", "t" }, "<C-w>j", smart_splits.swap_buf_down, desc = "Swap window down" },
      { mode = { "n", "t" }, "<C-w>k", smart_splits.swap_buf_up, desc = "Swap window up" },
      { mode = { "n", "t" }, "<C-w>l", smart_splits.swap_buf_right, desc = "Swap window right" },

      { mode = { "n", "t" }, "<A-h>", smart_splits.resize_left, desc = "Resize left" },
      { mode = { "n", "t" }, "<A-j>", smart_splits.resize_down, desc = "Resize down" },
      { mode = { "n", "t" }, "<A-k>", smart_splits.resize_up, desc = "Resize up" },
      { mode = { "n", "t" }, "<A-l>", smart_splits.resize_right, desc = "Resize right" },
    }
  end,
  opts = {
    cursor_follows_swapped_bufs = true,
  },
}
