local keys = {
  { "<leader>li", "<cmd>LspInfo<cr>", "LSP info" },
}

-- TODO: wait for neo-tree
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

local opts = {
  diagnostics = {
    virtual_text = { spacing = 2, prefix = "●" },
    signs = {
      text = {
        [vim.diagnostic.severity.ERROR] = "",
        [vim.diagnostic.severity.WARN] = "",
        [vim.diagnostic.severity.INFO] = "",
        [vim.diagnostic.severity.HINT] = "",
      },
    },
    update_in_insert = false,
    severity_sort = true,
  },
  servers = {
    "clangd",
    "nil_ls",
    "cmake",
    "terraformls",
    "gopls",
    "pyright",
    "lua_ls",
  },
}

local lsp = {}

lsp.lua_ls = {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      format = { enable = false },
      completion = { callSnippet = "Replace" },
      hint = { enable = true },
    },
  },
}

lsp.pyright = {}

lsp.nil_ls = {
  settings = {
    ["nil"] = {
      formatting = { command = { "nixfmt" } },
    },
  },
}

require("utils").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pack = "nvim-lspconfig",
  name = "lspconfig",
  keys = keys,
  before = { "neodev", "clangd_extensions" },
  config = function()
    require("utils").setup_diagnostic(signs, opts.diagnostics)
    require("utils").setup_lspconfig(opts.servers, lsp)
  end,
}
