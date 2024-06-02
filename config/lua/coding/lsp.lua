return {
  "neovim/nvim-lspconfig",
  event = "LazyFile",
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "hedyhli/outline.nvim", opts = {} },
  },
  keys = {
    { "<leader>lI", "<cmd>LspInfo<cr>", desc = "LSP info" },
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
      { "gd", "<cmd>Glance definitions<cr>", desc = "Go to definition", has = "definition" },
      { "gD", vim.lsp.buf.declaration, desc = "Go to declaration", has = "declaration" },
      { "gI", "<cmd>Glance implementations<cr>", desc = "Go to implementation", has = "implementation" },
      { "gr", "<cmd>Glance references<cr>", desc = "Go to references", has = "references" },
      { "gK", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
      { mode = "i", "<C-k>", vim.lsp.buf.signature_help, desc = "Signature Help", has = "signatureHelp" },
      { "gy", "<cmd>Glance type_definitions<cr>", desc = "Go to type definitions", has = "typeDefinition" },
      { mode = { "n", "v" }, "<leader>la", vim.lsp.buf.code_action, desc = "Code action", has = "codeAction" },
      { "<leader>lL", vim.lsp.codelens.run, desc = "CodeLens run", has = "codeLens" },
      { "<leader>lr", vim.lsp.buf.rename, desc = "Rename current symbol", has = "rename" },
      {
        "<leader>li",
        function()
          vim.lsp.inlay_hint.enable(not vim.lsp.inlay_hint.is_enabled({}))
        end,
        desc = "Toggle inlay hints",
        has = "inlayHint",
      },
      { "<leader>lq", vim.diagnostic.setloclist, desc = "List diagnostic", has = "diagnostic" },
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

    for server, server_opts in pairs(opts.servers) do
      require("lspconfig")[server].setup(require("utils.lsp").handlers(server_opts))
    end
  end,
}
