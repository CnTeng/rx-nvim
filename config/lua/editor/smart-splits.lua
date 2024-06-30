return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  keys = function()
    local smart_splits = require("smart-splits")
    return {
      { "<A-h>", smart_splits.resize_left, desc = "Resize left" },
      { "<A-j>", smart_splits.resize_down, desc = "Resize down" },
      { "<A-k>", smart_splits.resize_up, desc = "Resize up" },
      { "<A-l>", smart_splits.resize_right, desc = "Resize right" },

      { "<C-h>", smart_splits.move_cursor_left, desc = "Move cursor left" },
      { "<C-j>", smart_splits.move_cursor_down, desc = "Move cursor down" },
      { "<C-k>", smart_splits.move_cursor_up, desc = "Move cursor up" },
      { "<C-l>", smart_splits.move_cursor_right, desc = "Move cursor right" },
    }
  end,
  opts = {},
}
