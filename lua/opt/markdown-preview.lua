require("utils.plugin").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pattern = "*.md",
  name = "markdown-preview",
  setup = false,
}
