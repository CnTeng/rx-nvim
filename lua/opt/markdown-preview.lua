require("utils.plugin").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pname = "markdown-preview.nvim",
  pattern = "*.md",
  name = "markdown-preview",
  setup = false,
}
