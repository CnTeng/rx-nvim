local opts = function()
  local nls = require "null-ls"
  return {
    on_attach = function(_, bufnr)
      require("utils").keymap {
        mode = { "n", "v" },
        "<leader>lf",
        vim.lsp.buf.format,
        { silent = true, buffer = bufnr, desc = "Format code (nls)" },
      }
    end,
    sources = {
      nls.builtins.formatting.stylua,
      nls.builtins.formatting.black,
      nls.builtins.formatting.prettierd,
    },
  }
end

require("utils").lazy {
  name = "null-ls",
  pack = "none-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  opts = opts,
}
