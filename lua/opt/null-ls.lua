local opts = function()
  local nls = require "null-ls"
  return {
    sources = { nls.builtins.formatting.stylua },
  }
end

require("utils").lazy {
  name = "null-ls",
  pack = "null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = opts,
}
