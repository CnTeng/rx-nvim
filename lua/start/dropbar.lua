local keys = { { "<Leader>D", function() require("dropbar.api").pick() end, "Dropbar" } }

require("utils.plugin").load {
  name = "dropbar",
  keys = keys,
}
