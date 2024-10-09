return {
  ---@type LazyPluginSpec
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    keys = {
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP info" },
    },
    opts = {
      keys = {
        { "n", "gd", vim.lsp.buf.definition, { desc = "Definition" } },
        { "n", "gD", vim.lsp.buf.declaration, { desc = "Declaration" } },
        { "n", "gI", vim.lsp.buf.implementation, { desc = "Implementation" } },
        { "n", "gK", vim.lsp.buf.signature_help, { desc = "Signature help" } },
        { "i", "<C-k>", vim.lsp.buf.signature_help, { desc = "Signature help" } },
        { "n", "gr", vim.lsp.buf.references, { desc = "References" } },
        { "n", "gy", vim.lsp.buf.type_definition, { desc = "Type definitions" } },
        { { "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" } },
        { { "n", "x" }, "<leader>lr", vim.lsp.buf.rename, { desc = "Rename" } },
        { "n", "<leader>ld", vim.diagnostic.setloclist, { desc = "List diagnostic" } },
        { "n", "<leader>ll", vim.lsp.codelens.run, { desc = "Run codelens" } },
        {
          "n",
          "<leader>lh",
          function()
            local is_enabled = vim.lsp.inlay_hint.is_enabled()
            vim.lsp.inlay_hint.enable(not is_enabled)
          end,
          { desc = "Toggle inlay hints" },
        },
      },
      diagnostics = {
        virtual_text = false,
        signs = {
          text = {
            [vim.diagnostic.severity.ERROR] = "󰅚",
            [vim.diagnostic.severity.WARN] = "󰀪",
            [vim.diagnostic.severity.INFO] = "󰋽",
            [vim.diagnostic.severity.HINT] = "󰌶",
          },
        },
        update_in_insert = false,
        severity_sort = true,
      },
      servers = {},
    },
    config = function(_, opts)
      vim.diagnostic.config(opts.diagnostics)

      local function set_keymaps(keys, bufnr)
        for _, key in pairs(keys) do
          vim.keymap.set(key[1], key[2], key[3], {
            silent = true,
            buffer = bufnr,
            desc = key[4].desc,
          })
        end
      end

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "General LSP Attach",
        callback = function(args)
          vim.lsp.inlay_hint.enable()
          set_keymaps(opts.keys, args.buf)
        end,
      })

      local function capabilities(extra_caps)
        local caps = vim.lsp.protocol.make_client_capabilities()

        caps = require("cmp_nvim_lsp").default_capabilities(caps)
        caps.textDocument.foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        }

        return vim.tbl_deep_extend("force", caps, extra_caps or {})
      end

      local function handlers(server_opts)
        local handler = {
          capabilities = capabilities(server_opts.capabilities),
          on_attach = function(_, bufnr)
            if server_opts.keys then
              set_keymaps(server_opts.keys, bufnr)
            end
          end,
        }

        return vim.tbl_deep_extend("force", handler, server_opts or {})
      end

      for server, server_opts in pairs(opts.servers) do
        require("lspconfig")[server].setup(handlers(server_opts))
      end
    end,
  },

  {
    "hedyhli/outline.nvim",
    keys = {
      {
        "<leader>lo",
        function()
          require("outline").toggle()
        end,
        desc = "Toggle outline",
      },
    },
    opts = {},
  },

  {
    "rachartier/tiny-inline-diagnostic.nvim",
    event = "LspAttach",
    opts = {},
  },
}
