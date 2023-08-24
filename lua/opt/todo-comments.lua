local keys = {
  { "n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" } },
  { "n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" } },
  { "n", "<leader>st", ":TodoTelescope<CR>", { desc = "Todo comment" } },
}

require("utils.plugin").lazy {
  events = { "VimEnter", "BufRead" },
  pname = "todo-comments.nvim",
  name = "todo-comments",
  keys = keys,
}
