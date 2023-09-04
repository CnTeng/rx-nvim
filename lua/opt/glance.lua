require("utils.plugin").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pack = "glance.nvim",
  name = "glance",
  config = true,
}
