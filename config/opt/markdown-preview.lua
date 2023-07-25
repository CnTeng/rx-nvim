require("utils.plugin").lazy_plugin {
  events = { "BufReadPre", "BufNewFile" },
  pattern = "*.md",
  pname = "markdown-preview.nvim",
}
