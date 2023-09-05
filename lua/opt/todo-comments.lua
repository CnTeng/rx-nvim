local keys = {
  { "]t", function() require("todo-comments").jump_next() end, "Next todo comment" },
  { "[t", function() require("todo-comments").jump_prev() end, "Previous todo comment" },
  { "<leader>st", ":TodoTelescope<CR>", "Todo comment" },
}

require("utils").lazy {
  name = "todo-comments",
  pack = "todo-comments.nvim",
  event = { "BufReadPre", "BufNewFile" },
  keys = keys,
  config = true,
}
