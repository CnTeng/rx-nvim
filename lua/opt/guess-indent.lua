require("utils").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pack = "guess-indent.nvim",
  name = "guess-indent",
  config = true,
}
