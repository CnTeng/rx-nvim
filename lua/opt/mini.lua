local keys = {
  { "<leader>c", function() require("mini.bufremove").delete(0, false) end, "Close buffer" },
  { "<leader>bc", function() require("mini.bufremove").delete(0, false) end, "Close buffer" },
}

require("utils.plugin").lazy {
  event = { "BufReadPre", "BufNewFile" },
  name = "mini",
  setup = false,
  config = function() require("utils.plugin").load { name = "mini.bufremove", keys = keys } end,
}
