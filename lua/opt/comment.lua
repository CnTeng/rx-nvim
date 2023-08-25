local keys = {
  { "<leader>/", function() require("Comment.api").toggle.linewise.current() end, desc = "Comment line" },
  {
    mode = "v",
    "<leader>/",
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    "Comment line",
  },
}

require("utils.plugin").lazy {
  events = { "BufReadPre", "BufNewFile" },
  pname = "comment.nvim",
  name = "Comment",
  keys = keys,
}
