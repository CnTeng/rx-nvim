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
    "diagnosticls",
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

lsp.diagnosticls = {
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

lsp.nil_ls = {
  settings = {
    ["nil"] = {
      formatting = { command = { "alejandra" } },
    },
  },
}

require("utils.plugin").lazy {
  event = { "BufReadPre", "BufNewFile" },
  name = "lspconfig",
  setup = false,
  keys = keys,
  config = function()
    vim.api.nvim_exec_autocmds("User", { pattern = "neodev" })

    require("utils.lsp").setup_diagnostic(signs, opts.diagnostics)
    require("utils.lsp").setup_lspconfig(opts.servers, lsp)
  end,
}
