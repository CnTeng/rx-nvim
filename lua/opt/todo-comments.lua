local keys = {
  { "]t", function() require("todo-comments").jump_next() end, "Next todo comment" },
  { "[t", function() require("todo-comments").jump_prev() end, "Previous todo comment" },
  { "<leader>st", ":TodoTelescope<CR>", "Todo comment" },
}

require("utils.plugin").lazy {
  event = { "VimEnter", "BufRead" },
  name = "todo-comments",
  keys = keys,
}
