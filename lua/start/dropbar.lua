local keys = { { "n", "<Leader>D", function() require("dropbar.api").pick() end, { desc = "Dropbar" } } }

require("utils.plugin").load {
  name = "dropbar",
  keys = keys,
}
