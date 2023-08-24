local keys = {
  { "n", "<leader>c", function() require("mini.bufremove").delete(0, false) end, { desc = "Close buffer" } },
  { "n", "<leader>bc", function() require("mini.bufremove").delete(0, false) end, { desc = "Close buffer" } },
}

require("utils.plugin").lazy {
  events = { "BufReadPre", "BufNewFile" },
  pname = "mini.nvim",
  callback = function() require("utils.plugin").load { name = "mini.bufremove", keys = keys } end,
}
