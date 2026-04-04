vim.keymap.del("n", "grn")
vim.keymap.del({ "n", "x" }, "gra")
vim.keymap.del("n", "grx")
vim.keymap.del("n", "grr")
vim.keymap.del("n", "gri")
vim.keymap.del("n", "grt")
vim.keymap.del("n", "gO")

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

vim.lsp.inlay_hint.enable()
vim.lsp.inline_completion.enable()

vim.api.nvim_create_autocmd("LspAttach", {
  desc = "General LSP Attach",
  callback = function(args)
    local bufnr = args.buf
    local client = assert(vim.lsp.get_client_by_id(args.data.client_id))

    if client:supports_method("textDocument/foldingRange") then
      local win = vim.api.nvim_get_current_win()
      vim.wo[win][0].foldexpr = "v:lua.vim.lsp.foldexpr()"
    end

    vim.keymap.set("n", "<leader>li", "<cmd>checkhealth vim.lsp<cr>", { buf = bufnr, desc = "Lsp info" })

    vim.keymap.set({ "n", "x" }, "<leader>lr", vim.lsp.buf.rename, { buf = bufnr, desc = "Rename" })
    vim.keymap.set({ "n", "x" }, "<leader>la", vim.lsp.buf.code_action, { buf = bufnr, desc = "Code action" })
    vim.keymap.set("n", "<leader>lx", vim.lsp.codelens.run, { buf = bufnr, desc = "Run codelens" })

    vim.keymap.set("n", "gr", vim.lsp.buf.references, { buf = bufnr, desc = "References" })
    vim.keymap.set("n", "gI", vim.lsp.buf.implementation, { buf = bufnr, desc = "Implementation" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buf = bufnr, desc = "Definition" })
    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { buf = bufnr, desc = "Declaration" })
    vim.keymap.set("n", "gy", vim.lsp.buf.type_definition, { buf = bufnr, desc = "Type definitions" })

    vim.keymap.set("n", "<leader>ld", vim.diagnostic.setloclist, { buf = bufnr, desc = "List diagnostic" })

    if client:supports_method("textDocument/inlayHint") then
      vim.keymap.set("n", "<leader>lh", function()
        local is_enabled = vim.lsp.inlay_hint.is_enabled()
        vim.lsp.inlay_hint.enable(not is_enabled)
      end, { buf = bufnr, desc = "Toggle inlay hint" })
    end

    if client:supports_method("textDocument/inlineCompletion") then
      vim.keymap.set("n", "<leader>lc", function()
        local is_enabled = vim.lsp.inline_completion.is_enabled()
        vim.lsp.inline_completion.enable(not is_enabled)
      end, { buf = bufnr, desc = "Toggle inline completion" })

      vim.keymap.set("i", "<C-j>", function()
        if not vim.lsp.inline_completion.get() then
          return "<C-j>"
        end
      end, { expr = true, buf = bufnr, desc = "Accept inline completion" })
    end

    if client:supports_method("textDocument/codeLens") then
      vim.keymap.set("n", "<leader>ll", function()
        local is_enabled = vim.lsp.codelens.is_enabled()
        vim.lsp.codelens.enable(not is_enabled)
      end, { buf = bufnr, desc = "Toggle code lens" })
    end
  end,
})
