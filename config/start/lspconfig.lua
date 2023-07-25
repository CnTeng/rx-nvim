local keys = {
  { "n", "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP info" },
}
local signs = {
  { name = "DiagnosticSignError", text = "" },
  { name = "DiagnosticSignWarn", text = "" },
  { name = "DiagnosticSignHint", text = "" },
  { name = "DiagnosticSignInfo", text = "" },
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
  },
}

require("utils.plugin").load_plugin {
  name = "neodev",
  opts = {
    override = function(root_dir, library)
      if root_dir:find("/home/yufei/Projects/rx-nvim", 1, true) == 1 then
        library.enabled = true
        library.plugins = true
      end
    end,
  },
}

require("utils.plugin").load_plugin { keys = keys }

require("utils.lsp").setup_diagnostic_signs(signs, opts.diagnostics)

require("lspconfig").lua_ls.setup {
  settings = {
    Lua = {
      format = { enable = false },
    },
  },
}

require("lspconfig").diagnosticls.setup {
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

require("utils.lsp").setup_lspconfig(opts.servers)
