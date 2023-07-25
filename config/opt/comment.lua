local keys = {
  { "n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end, { desc = "Comment line" } },
  {
    "v",
    "<leader>/",
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    { desc = "Comment line" },
  },
}

require("utils.plugin").lazy_plugin {
  events = { "BufReadPre", "BufNewFile" },
  pname = "comment.nvim",
  name = "Comment",
  keys = keys,
}
