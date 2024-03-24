return {
  "folke/todo-comments.nvim",
  cmd = "TodoQuickFix",
  event = "LazyFile",
  keys = {
    { "]t", function() require("todo-comments").jump_next() end, desc = "Next todo comment" },
    { "[t", function() require("todo-comments").jump_prev() end, desc = "Previous todo comment" },
    { "<leader>st", "<cmd>TodoQuickFix<cr>", "Todo comment" },
  },
  opts = {},
}
