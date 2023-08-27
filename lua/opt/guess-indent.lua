require("utils.plugin").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pname = "guess-indent.nvim",
  name = "guess-indent",
}
