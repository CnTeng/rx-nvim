local opts = {
  options = { try_as_border = true },
  symbol = "▎",
}

local keys = {
  { "n", "<leader>c", function() require("mini.bufremove").delete(0, false) end, { desc = "Close buffer" } },
  { "n", "<leader>bc", function() require("mini.bufremove").delete(0, false) end, { desc = "Close buffer" } },
}

vim.api.nvim_create_autocmd("FileType", {
  pattern = { "help", "alpha", "NvimTree" },
  callback = function() vim.b.miniindentscope_disable = true end,
})

require("utils.plugin").lazy {
  events = { "BufReadPre", "BufNewFile" },
  pname = "mini.nvim",
  callback = function()
    require("utils.plugin").load { name = "mini.indentscope", opts = opts }
    require("utils.plugin").load { name = "mini.bufremove", keys = keys }
  end,
}
