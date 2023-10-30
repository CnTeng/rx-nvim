local init = function() vim.o.formatexpr = "v:lua.require'conform'.formatexpr()" end

local keys = {
  {
    mode = { "n", "v" },
    "<leader>lf",
    function() require("conform").format { lsp_fallback = true } end,
    "Format code",
  },
}

local opts = {
  formatters_by_ft = {
    lua = { "stylua" },
    python = { "black" },
    yaml = { "prettierd" },
    markdown = { "prettierd" },
  },
}

require("utils").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pack = "conform.nvim",
  name = "conform",
  init = init,
  keys = keys,
  opts = opts,
}
