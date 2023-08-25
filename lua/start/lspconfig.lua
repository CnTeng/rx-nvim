local keys = {
  { "n", "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP info" },
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
    "lua_ls", -- Lua
    "clangd", -- C++ & C
    "nil_ls", -- Nix
    "diagnosticls",
  },
}

require("utils.plugin").load { name = "neodev" }

require("utils.plugin").load { keys = keys }

require("utils.lsp").setup_diagnostic_signs(signs, opts.diagnostics)

local lsp_config = {}

lsp_config.lua_ls = {
  settings = {
    Lua = {
      workspace = { checkThirdParty = false },
      format = { enable = false },
      completion = { callSnippet = "Replace" },
      hint = { enable = true },
    },
  },
}

lsp_config.diagnosticls = {
  filetypes = { "lua" },
  init_options = {
    filetypes = {
      lua = "stylua",
    },
    formatters = {
      stylua = {
        command = "stylua",
        args = {
          "--search-parent-directories",
          "--stdin-filepath",
          "%filepath",
          "--",
          "-",
        },
      },
    },
    formatFiletypes = {
      lua = "stylua",
    },
  },
}

require("utils.lsp").setup_lspconfig(opts.servers, lsp_config)
