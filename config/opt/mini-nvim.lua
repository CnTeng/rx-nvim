local opts = {
  options = { try_as_border = true },
  symbol = "▎",
}

local keys = {
  { "n", "<leader>c", function() require("mini.bufremove").delete(0, false) end, { desc = "Close buffer" } },
  { "n", "<leader>bc", function() require("mini.bufremove").delete(0, false) end, { desc = "Close buffer" } },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "alpha", "coc-explorer" },
  callback = function() vim.b.miniindentscope_disable = true end,
})

require("core.utils").lazy_plugin {
  events = { "BufReadPre", "BufNewFile" },
  callback = function()
    vim.cmd.packadd "mini.nvim"

    require("core.utils").load_plugin { name = "mini.indentscope", opts = opts }
    require("core.utils").load_plugin { name = "mini.bufremove", keys = keys }
  end,
}
