local opts = {
  history = true,
  delete_check_events = "TextChanged",
}

require("utils.plugin").load {
  name = "luasnip",
  opts = opts,
}
