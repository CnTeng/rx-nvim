local keys = { { "<Leader>D", function() require("dropbar.api").pick() end, "Dropbar" } }

require("utils.plugin").lazy {
  event = { "BufReadPre", "BufNewFile" },
  name = "dropbar",
  keys = keys,
}
