vim.keymap.set("n", "<leader>li", "<cmd>checkhealth vim.lsp<cr>", { noremap = true, desc = "LSP info" })

vim.diagnostic.config({
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
})

vim.keymap.del("n", "grn")
vim.keymap.del({ "n", "x" }, "gra")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "General LSP Attach",
  callback = function(args)
    vim.lsp.inlay_hint.enable()

    local client = vim.lsp.get_client_by_id(args.data.client_id)
    if not client then
      return
    end

    if client:supports_method("textDocument/inlayHint") then
      vim.lsp.inlay_hint.enable(true, {
        bufnr = args.buf,
      })
    end

    local keymaps = {
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
    }

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

vim.lsp.enable({
  "bashls",
  "clangd",
  "cmake",
  "dockerls",
  "golangci_lint_ls",
  "gopls",
  "lua_ls",
  "nil_ls",
  "pyright",
  "rust_analyzer",
})
