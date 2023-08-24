local opts = {
  resize_mode = {
    silent = true,
    hooks = {
      on_enter = function() vim.notify "Enter resize mode" end,
      on_leave = function() vim.notify "Exit resize mode" end,
    },
  },
}

local keys = {
  { "n", "<A-r>", function() require("smart-splits").start_resize_mode() end },
  { "n", "<A-h>", function() require("smart-splits").resize_left() end },
  { "n", "<A-j>", function() require("smart-splits").resize_down() end },
  { "n", "<A-k>", function() require("smart-splits").resize_up() end },
  { "n", "<A-l>", function() require("smart-splits").resize_right() end },
  -- Better window navigation
  { "n", "<C-h>", function() require("smart-splits").move_cursor_left() end },
  { "n", "<C-j>", function() require("smart-splits").move_cursor_down() end },
  { "n", "<C-k>", function() require("smart-splits").move_cursor_up() end },
  { "n", "<C-l>", function() require("smart-splits").move_cursor_right() end },
}

require("utils.plugin").load { name = "smart-splits", opts = opts, keys = keys }
