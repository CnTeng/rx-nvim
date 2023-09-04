require("utils").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pack = "markdown-preview.nvim",
  ft = "*.md",
  name = "markdown-preview",
}
