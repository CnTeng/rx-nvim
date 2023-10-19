local keys = {
  { "<leader>li", "<cmd>LspInfo<cr>", "LSP info" },
}

local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
}

local opts = {
  diagnostics = {
    underline = true,
    signs = { active = signs },
    virtual_text = { spacing = 2, prefix = "●" },
    update_in_insert = false,
    severity_sort = true,
  },
  servers = {
    "clangd",
    "nil_ls",
    "neocmake",
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
      formatting = { command = { "alejandra" } },
    },
  },
}

require("utils").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pack = "nvim-lspconfig",
  name = "lspconfig",
  keys = keys,
  before = { "neodev", "clangd_extensions", "null-ls" },
  config = function()
    require("utils").setup_diagnostic(signs, opts.diagnostics)
    require("utils").setup_lspconfig(opts.servers, lsp)
  end,
}
