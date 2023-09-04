local keys = { { "<Leader>D", function() require("dropbar.api").pick() end, "Dropbar" } }

require("utils.plugin").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pack = "dropbar.nvim",
  name = "dropbar",
  keys = keys,
  config = true,
}
