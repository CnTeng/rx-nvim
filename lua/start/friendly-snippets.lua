require("utils.plugin").lazy {
  name = "friendly-snippets",
  lazy = false,
  config = function() require("luasnip.loaders.from_vscode").lazy_load() end,
}
