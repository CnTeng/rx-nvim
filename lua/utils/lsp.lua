local M = {}

function M.setup_diagnostic(signs, diagnostics)
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
  local function keymap(key)
    key[3] = { silent = true, buffer = bufnr, desc = key[3] }
    require("utils").keymap(key)
  end

  if client.supports_method "textDocument/definition" then
    keymap { "gd", "<cmd>Glance definitions<cr>", "Goto definition" }
  end

  if client.supports_method "textDocument/declaration" then
    keymap { "gD", vim.lsp.buf.declaration, "Go todeclaration" }
  end

  if client.supports_method "textDocument/implementation" then
    keymap { "gI", "<cmd>Glance implementations<cr>", "Goto implementation" }
  end

  if client.supports_method "textDocument/references" then
    keymap { "gr", "<cmd>Glance references<cr>", "Goto references" }
  end

  if client.supports_method "textDocument/typeDefinition" then
    keymap { "gt", "<cmd>Glance type_definitions<cr>", "Goto type definitions" }
  end

  if client.supports_method "textDocument/codeAction" then
    keymap { mode = { "n", "v" }, "<leader>la", vim.lsp.buf.code_action, "Code action" }
  end

  if client.supports_method "textDocument/formatting" then
    keymap { mode = { "n", "v" }, "<leader>lf", vim.lsp.buf.format, "Format code" }
  end

  if client.supports_method "textDocument/codeLens" then
    keymap { "<leader>lL", vim.lsp.codelens.run, "CodeLens run" }
  end

  if client.supports_method "textDocument/rename" then
    keymap { "<leader>lr", vim.lsp.buf.rename, "Rename current symbol" }
  end

  if client.supports_method "textDocument/signatureHelp" then
    keymap { "<leader>ls", vim.lsp.buf.signature_help, "Signature help" }
  end

  keymap { "<leader>lk", vim.diagnostic.open_float, "Line diagnostics" }
  keymap { "<leader>lq", vim.diagnostic.setloclist, "List diagnostic" }
  keymap { "]d", vim.diagnostic.goto_next, "Next diagnostic" }
  keymap { "[d", vim.diagnostic.goto_prev, "Previous diagnostic" }

  if client.supports_method "textDocument/inlayHint" then
    vim.lsp.inlay_hint(bufnr, true)
    keymap { "<leader>lI", function() vim.lsp.inlay_hint(bufnr) end, "Toggle inlay hints" }
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
    else
      require("lspconfig")[server].setup(default_handlers)
    end
  end
end

return M
