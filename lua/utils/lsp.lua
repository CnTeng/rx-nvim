local M = {}

function M.setup_diagnostic_signs(signs, diagnostics)
  for _, sign in ipairs(signs) do
    if not sign.texthl then sign.texthl = sign.name end
    vim.fn.sign_define(sign.name, sign)
  end

  vim.diagnostic.config(diagnostics)
end

local function keymap(mode, lhs, rhs, opts)
  vim.keymap.set(mode, lhs, rhs, {
    silent = true,
    buffer = opts.buffer,
    desc = opts.desc,
  })
end

local function setup_lsp_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()

  capabilities.textDocument.foldingRange = {
    dynamicRegistration = false,
    lineFoldingOnly = true,
  }
  capabilities = require("cmp_nvim_lsp").default_capabilities(capabilities)

  return capabilities
end

local function on_attach(client, bufnr)
  local function telescope_lsp(api)
    require("telescope.builtin")["lsp_" .. api] {
      layout_strategy = "bottom_pane",
      layout_config = {
        height = 0.3,
        prompt_position = "bottom",
        preview_cutoff = 1,
        preview_width = 0.4,
      },
      reuse_win = true,
    }
  end

  if client.supports_method "textDocument/definition" then
    keymap("n", "gd", function() telescope_lsp "definitions" end, { buffer = bufnr, desc = "Goto definition" })
  end

  if client.supports_method "textDocument/declaration" then
    keymap("n", "gD", vim.lsp.buf.declaration, { buffer = bufnr, desc = "Go todeclaration" })
  end

  if client.supports_method "textDocument/implementation" then
    keymap("n", "gI", function() telescope_lsp "implementations" end, { buffer = bufnr, desc = "Goto implementation" })
  end

  if client.supports_method "textDocument/references" then
    keymap("n", "gr", function() telescope_lsp "references" end, { buffer = bufnr, desc = "Goto references" })
  end

  if client.supports_method "textDocument/typeDefinition" then
    keymap(
      "n",
      "gt",
      function() telescope_lsp "type_definitions" end,
      { buffer = bufnr, desc = "Goto type definitions" }
    )
  end

  if client.supports_method "textDocument/codeAction" then
    keymap({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, { buffer = bufnr, desc = "Code action" })
  end

  if client.supports_method "textDocument/formatting" then
    keymap({ "n", "v" }, "<leader>lf", vim.lsp.buf.format, { buffer = bufnr, desc = "Format code (LSP)" })
  end

  if client.supports_method "textDocument/codeLens" then
    keymap("n", "<leader>lL", vim.lsp.codelens.run, { buffer = bufnr, desc = "CodeLens run" })
  end

  if client.supports_method "textDocument/rename" then
    keymap("n", "<leader>lr", vim.lsp.buf.rename, { buffer = bufnr, desc = "Rename current symbol" })
  end

  if client.supports_method "textDocument/signatureHelp" then
    keymap("n", "<leader>ls", vim.lsp.buf.signature_help, { buffer = bufnr, desc = "Signature help" })
  end

  keymap("n", "<leader>ld", vim.diagnostic.open_float, { buffer = bufnr, desc = "Line diagnostics" })
  keymap("n", "<leader>lq", vim.diagnostic.setloclist, { buffer = bufnr, desc = "List diagnostic" })
  keymap("n", "]d", vim.diagnostic.goto_next, { buffer = bufnr, desc = "Next diagnostic" })
  keymap("n", "[d", vim.diagnostic.goto_prev, { buffer = bufnr, desc = "Previous diagnostic" })

  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint(bufnr, true)
    keymap("n", "<leader>lI", function() vim.lsp.inlay_hint(bufnr) end, { buffer = bufnr, desc = "Toggle inlay hints" })
  end
end

function M.setup_lspconfig(servers)
  local default_handlers = {
    on_attach = on_attach,
    capabilities = setup_lsp_capabilities(),
  }

  for _, server in ipairs(servers) do
    --   local has_extra_handlers, extra_handlers = pcall(require, "coding.lspconfig." .. server)
    --
    --   if has_extra_handlers then
    --     require("lspconfig")[server].setup(vim.tbl_deep_extend("force", default_handlers, extra_handlers))
    --   else
    if server == "lua_ls" then
      require("lspconfig")[server].setup(vim.tbl_deep_extend("force", default_handlers, {
        settings = {
          Lua = {
            workspace = { checkThirdParty = false },
            format = { enable = false },
            completion = { callSnippet = "Replace" },
            hint = { enable = true },
          },
        },
      }))
      return
    end

    require("lspconfig")[server].setup(default_handlers)
    --   end
  end
end

return M
