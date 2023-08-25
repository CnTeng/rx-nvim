local keys = {
  { "<leader>c", function() require("mini.bufremove").delete(0, false) end, "Close buffer" },
  { "<leader>bc", function() require("mini.bufremove").delete(0, false) end, "Close buffer" },
}

require("utils.plugin").lazy {
  events = { "BufReadPre", "BufNewFile" },
  pname = "mini.nvim",
  callback = function() require("utils.plugin").load { name = "mini.bufremove", keys = keys } end,
}
