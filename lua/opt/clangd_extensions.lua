local opts = {
  inlay_hints = { inline = true },
}

require("utils.plugin").lazy {
  event = { "BufReadPre", "BufNewFile" },
  name = "clangd_extensions",
  opts = opts,
}
