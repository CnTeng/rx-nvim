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

      { mode = { "n", "t" }, "<C-w>r", smart_splits.start_resize_mode, desc = "Enter resize mode" },
    }
  end,
  opts = {
    cursor_follows_swapped_bufs = true,
    resize_mode = {
      resize_keys = { "h", "j", "k", "l" },
      silent = true,
      hooks = {
        on_enter = function()
          vim.notify("Enter resize mode")
        end,
        on_leave = function()
          vim.notify("Exit resize mode")
        end,
      },
    },
  },
}
