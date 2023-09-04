local opts = {
  history = true,
  delete_check_events = "TextChanged",
}

require("utils.plugin").lazy {
  name = "luasnip",
  lazy = false,
  after = "friendly-snippets",
  opts = opts,
}
