---@type LazyPluginSpec
return {
  "mrjones2014/smart-splits.nvim",
  event = "VeryLazy",
  keys = {
    {
      mode = { "n", "t" },
      "<C-h>",
      function()
        require("smart-splits").move_cursor_left()
      end,
      desc = "Move cursor left",
    },
    {
      mode = { "n", "t" },
      "<C-j>",
      function()
        require("smart-splits").move_cursor_down()
      end,
      desc = "Move cursor down",
    },
    {
      mode = { "n", "t" },
      "<C-k>",
      function()
        require("smart-splits").move_cursor_up()
      end,
      desc = "Move cursor up",
    },
    {
      mode = { "n", "t" },
      "<C-l>",
      function()
        require("smart-splits").move_cursor_right()
      end,
      desc = "Move cursor right",
    },

    {
      mode = { "n", "t" },
      "<C-w>h",
      function()
        require("smart-splits").swap_buf_left()
      end,
      desc = "Swap window left",
    },
    {
      mode = { "n", "t" },
      "<C-w>j",
      function()
        require("smart-splits").swap_buf_down()
      end,
      desc = "Swap window down",
    },
    {
      mode = { "n", "t" },
      "<C-w>k",
      function()
        require("smart-splits").swap_buf_up()
      end,
      desc = "Swap window up",
    },
    {
      mode = { "n", "t" },
      "<C-w>l",
      function()
        require("smart-splits").swap_buf_right()
      end,
      desc = "Swap window right",
    },

    {
      mode = { "n", "t" },
      "<A-h>",
      function()
        require("smart-splits").resize_left()
      end,
      desc = "Resize left",
    },
    {
      mode = { "n", "t" },
      "<A-j>",
      function()
        require("smart-splits").resize_down()
      end,
      desc = "Resize down",
    },
    {
      mode = { "n", "t" },
      "<A-k>",
      function()
        require("smart-splits").resize_up()
      end,
      desc = "Resize up",
    },
    {
      mode = { "n", "t" },
      "<A-l>",
      function()
        require("smart-splits").resize_right()
      end,
      desc = "Resize right",
    },
  },
  opts = {
    cursor_follows_swapped_bufs = true,
  },
}
