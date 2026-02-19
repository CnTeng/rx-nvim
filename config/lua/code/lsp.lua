---@type LazyPluginSpec[]
return {
  {
    "neovim/nvim-lspconfig",
    event = "LazyFile",
    keys = {
      { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP info" },
    },
    init = function()
      vim.keymap.del("n", "grn")
      vim.keymap.del({ "n", "x" }, "gra")
      vim.keymap.del("n", "grr")
      vim.keymap.del("n", "gri")
      vim.keymap.del("n", "grt")
    end,
    opts = {
      diagnostics = {
        virtual_lines = { current_line = true },
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

      servers = {
        "basedpyright",
        "bashls",
        "biome",
        "clangd",
        "dockerls",
        "golangci_lint_ls",
        "gopls",
        "jsonls",
        "lua_ls",
        "neocmake",
        "nil_ls",
        "ruff",
        "rust_analyzer",
        "tailwindcss",
        "taplo",
        "tofu_ls",
        "tsgo",
        "yamlls",
      },

      keys = {
        { "n", "K", vim.lsp.buf.hover, { desc = "Hover" } },
        { "n", "gd", vim.lsp.buf.definition, { desc = "Definition" } },
        { "n", "gD", vim.lsp.buf.declaration, { desc = "Declaration" } },
        { "n", "gI", vim.lsp.buf.implementation, { desc = "Implementation" } },
        { "n", "gr", vim.lsp.buf.references, { desc = "References" } },
        { "n", "gy", vim.lsp.buf.type_definition, { desc = "Type definitions" } },
        { { "n", "x" }, "<leader>la", vim.lsp.buf.code_action, { desc = "Code action" } },
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

      extra_keys = {
        clangd = {
          { "n", "<leader>cs", "<cmd>LspClangdSwitchSourceHeader<cr>", { desc = "Switch source/header" } },
          { "n", "<leader>ci", "<cmd>LspClangdShowSymbolInfo<cr>", { desc = "Show symbol info" } },
        },
      },
    },

    config = function(_, opts)
      vim.diagnostic.config(opts.diagnostics)

      vim.api.nvim_create_autocmd("LspAttach", {
        desc = "General LSP Attach",
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          if not client then
            return
          end

          if client:supports_method("textDocument/inlayHint") then
            vim.lsp.inlay_hint.enable()
          end

          if client:supports_method("textDocument/foldingRange") then
            local win = vim.api.nvim_get_current_win()
            vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
          end

          local keymaps = vim.tbl_deep_extend("force", opts.keys or {}, opts.extra_keys[client.name] or {})
          for _, key in pairs(keymaps) do
            vim.keymap.set(key[1], key[2], key[3], {
              noremap = false,
              silent = true,
              buffer = args.buf,
              desc = key[4].desc,
            })
          end
        end,
      })

      vim.lsp.enable(opts.servers)
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
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "lazy.nvim", words = { "Lazy" } },
        { path = "snacks.nvim", words = { "Snacks", "snacks" } },
      },
    },
    config = function(_, opts)
      require("blink-cmp").add_source_provider("lazydev", {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      })
      require("blink-cmp").add_filetype_source("lua", "lazydev")

      require("lazydev").setup(opts)
    end,
  },

  { "b0o/SchemaStore.nvim", event = "VeryLazy" },
}
