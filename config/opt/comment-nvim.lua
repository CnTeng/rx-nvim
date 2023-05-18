local keys = {
  { "n", "<leader>/", function() require("Comment.api").toggle.linewise.current() end, { desc = "Comment line" } },
  {
    "v",
    "<leader>/",
    "<esc><cmd>lua require('Comment.api').toggle.linewise(vim.fn.visualmode())<cr>",
    { desc = "Comment line" },
  },
}

require("core.utils").lazy_plugin {
  events = { "BufReadPre", "BufNewFile" },
  callback = function()
    vim.cmd.packadd "comment.nvim"
    require("core.utils").load_plugin { name = "Comment", keys = keys }
  end,
}
