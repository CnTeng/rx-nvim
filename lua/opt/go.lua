require("utils").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pack = "go.nvim",
  name = "go",
  config = true,
}
