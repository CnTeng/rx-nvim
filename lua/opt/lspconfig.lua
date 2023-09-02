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
    "clangd", -- C++ & C
    "nil_ls", -- Nix
    "efm",
    "neocmake",
  },
}

local lsp = {}

if vim.g.luasupport then
  table.insert(opts.servers, "lua_ls")

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
end

lsp.nil_ls = {
  settings = {
    ["nil"] = {
      formatting = { command = { "alejandra" } },
    },
  },
}

local stylua = require "efmls-configs.formatters.stylua"
local dprint = require "efmls-configs.formatters.dprint"
local languages = {
  lua = { stylua },
  markdown = { dprint },
}

lsp.efm = {
  filetypes = vim.tbl_keys(languages),
  init_options = {
    documentFormatting = true,
    documentRangeFormatting = true,
  },
  settings = {
    rootMarkers = { ".git/" },
    languages = languages,
  },
}

require("utils.plugin").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pname = "nvim-lspconfig",
  name = "lspconfig",
  setup = false,
  keys = keys,
  before = { "neodev", "clangd_extensions" },
  config = function()
    require("utils.lsp").setup_diagnostic(signs, opts.diagnostics)
    require("utils.lsp").setup_lspconfig(opts.servers, lsp)
  end,
}
