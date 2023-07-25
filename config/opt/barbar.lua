local opts = {
  auto_hide = true,
  sidebar_filetypes = {
    ["neo-tree"] = { event = "BufWipeout", text = "File Explorer" },
  },
}

local keys = {
  { "n", "[b", "<cmd>BufferPrevious<cr>", { desc = "Previous buffer" } },
  { "n", "]b", "<cmd>BufferNext<cr>", { desc = "Next buffer" } },
  { "n", "<S-h>", "<cmd>BufferPrevious<cr>", { desc = "Previous buffer" } },
  { "n", "<S-l>", "<cmd>BufferNext<cr>", { desc = "Next buffer" } },
  { "n", "<A-,>", "<cmd>BufferMovePrevious<cr>", { silent = true, desc = "Move buffer Left" } },
  { "n", "<A-.>", "<cmd>BufferMoveNext<cr>", { silent = true, desc = "Move buffer Right" } },
  --
  -- { "n", "<leader>bC", "<cmd>bdelete<cr>", { desc = "Close buffer (without layout)" } },
  -- { "n", "<leader>bh", "<cmd>BufferLineMovePrev<cr>", { silent = true, desc = "Move buffer Left" } },
  -- { "n", "<leader>bl", "<cmd>BufferLineMoveNext<cr>", { silent = true, desc = "Move buffer Right" } },
}

require("utils.plugin").lazy_plugin {
  events = "BufEnter",
  pname = "barbar.nvim",
  name = "barbar",
  opts = opts,
  keys = keys,
}
