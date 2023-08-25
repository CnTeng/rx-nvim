local M = {}

function M.setup_diagnostic_signs(signs, diagnostics)
  for _, sign in ipairs(signs) do
    if not sign.texthl then sign.texthl = sign.name end
    vim.fn.sign_define(sign.name, sign)
  end

  vim.diagnostic.config(diagnostics)
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
  local function telescope(api)
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

  local function keymap(mode, lhs, rhs, desc)
    vim.keymap.set(mode, lhs, rhs, {
      silent = true,
      buffer = bufnr,
      desc = desc,
    })
  end

  if client.supports_method "textDocument/definition" then
    keymap("n", "gd", function() telescope "definitions" end, "Goto definition")
  end

  if client.supports_method "textDocument/declaration" then
    keymap("n", "gD", vim.lsp.buf.declaration, "Go todeclaration")
  end

  if client.supports_method "textDocument/implementation" then
    keymap("n", "gI", function() telescope "implementations" end, "Goto implementation")
  end

  if client.supports_method "textDocument/references" then
    keymap("n", "gr", function() telescope "references" end, "Goto references")
  end

  if client.supports_method "textDocument/typeDefinition" then
    keymap("n", "gt", function() telescope "type_definitions" end, "Goto type definitions")
  end

  if client.supports_method "textDocument/codeAction" then
    keymap({ "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Code action")
  end

  if client.supports_method "textDocument/formatting" then
    keymap({ "n", "v" }, "<leader>lf", vim.lsp.buf.format, "Format code")
  end

  if client.supports_method "textDocument/codeLens" then
    keymap("n", "<leader>lL", vim.lsp.codelens.run, "CodeLens run")
  end

  if client.supports_method "textDocument/rename" then
    keymap("n", "<leader>lr", vim.lsp.buf.rename, "Rename current symbol")
  end

  if client.supports_method "textDocument/signatureHelp" then
    keymap("n", "<leader>ls", vim.lsp.buf.signature_help, "Signature help")
  end

  keymap("n", "<leader>ld", vim.diagnostic.open_float, "Line diagnostics")
  keymap("n", "<leader>lq", vim.diagnostic.setloclist, "List diagnostic")
  keymap("n", "]d", vim.diagnostic.goto_next, "Next diagnostic")
  keymap("n", "[d", vim.diagnostic.goto_prev, "Previous diagnostic")

  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint(bufnr, true)
    keymap("n", "<leader>lI", function() vim.lsp.inlay_hint(bufnr) end, "Toggle inlay hints")
  end
end

function M.setup_lspconfig(servers, lsp_config)
  local default_handlers = {
    on_attach = on_attach,
    capabilities = setup_lsp_capabilities(),
  }

  for _, server in ipairs(servers) do
    if lsp_config[server] ~= nil then
      require("lspconfig")[server].setup(vim.tbl_deep_extend("force", default_handlers, lsp_config[server]))
    end
  end
end

return M
