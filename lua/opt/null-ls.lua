local opts = function()
  local nls = require "null-ls"
  return {
    sources = {
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.prettierd,
    },
  }
end

require("utils").lazy {
  name = "null-ls",
  pack = "null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = opts,
}
