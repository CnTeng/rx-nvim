local opts = {
  history = true,
  delete_check_events = "TextChanged",
}

require("utils.plugin").load_plugin {
  name = "luasnip",
  opts = opts,
}
