---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  event = "LazyFile",
  dependencies = {
    { "hedyhli/outline.nvim", opts = {} },
  },
  keys = {
    { "<leader>li", "<cmd>LspInfo<cr>", desc = "LSP info" },
    {
      "<leader>lo",
      function()
        require("outline").toggle()
      end,
      desc = "Toggle outline",
    },
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
    servers = {},
  },
  config = function(_, opts)
    vim.diagnostic.config(opts.diagnostics)

    local function capabilities(extra_caps)
      local caps = vim.lsp.protocol.make_client_capabilities()

      caps = require("cmp_nvim_lsp").default_capabilities(caps)

      caps.textDocument.foldingRange = {
        dynamicRegistration = false,
        lineFoldingOnly = true,
      }

      if extra_caps then
        caps = vim.tbl_deep_extend("force", caps, extra_caps)
      end

      return caps
    end

    local function on_attach(extra_keys)
      local keys = vim.deepcopy(opts.keys)

      if extra_keys then
        vim.list_extend(keys, extra_keys)
      end

      return function(_, bufnr)
        vim.lsp.inlay_hint.enable()

        for _, key in pairs(keys) do
          vim.keymap.set(key[1], key[2], key[3], {
            silent = true,
            buffer = bufnr,
            desc = key[4].desc,
          })
        end
      end
    end

    local function handlers(server_opts)
      local handler = {
        capabilities = capabilities(server_opts.capabilities),
        on_attach = on_attach(server_opts.keys),
      }

      if server_opts then
        handler = vim.tbl_deep_extend("force", handler, server_opts)
      end

      return handler
    end

    for server, server_opts in pairs(opts.servers) do
      require("lspconfig")[server].setup(handlers(server_opts))
    end
  end,
}
