require("utils.plugin").lazy {
  events = { "BufReadPre", "BufNewFile" },
  pattern = "*.md",
  pname = "markdown-preview.nvim",
}
