vim.api.nvim_create_autocmd({ "BufRead" }, {
  callback = function() require("todo-comments").setup {} end,
})

local keys = {
  { "n", "]t", function() require("todo-comments").jump_next() end, { desc = "Next todo comment" } },
  { "n", "[t", function() require("todo-comments").jump_prev() end, { desc = "Previous todo comment" } },
  { "n", "<leader>st", ":TodoTelescope<CR>", { desc = "Todo comment" } },
}

require("core.utils").lazy_plugin {
  events = "VimEnter",
  callback = function()
    vim.cmd.packadd "todo-comments.nvim"
    require("core.utils").load_plugin { name = "todo-comments", keys = keys }
  end,
}
