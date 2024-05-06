local M = {}

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
    local mode = key.mode ~= nil and key.mode or "n"
    key[3] = { silent = true, buffer = bufnr, desc = key[3] }
    vim.keymap.set(mode, key[1], key[2], key[3])
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

  if client.supports_method "textDocument/codeLens" then
    keymap { "<leader>lL", vim.lsp.codelens.run, "CodeLens run" }
  end

  if client.supports_method "textDocument/rename" then
    keymap { "<leader>lr", vim.lsp.buf.rename, "Rename current symbol" }
  end

  if client.supports_method "textDocument/signatureHelp" then
    keymap { "<leader>ls", vim.lsp.buf.signature_help, "Signature help" }
  end

  if client.supports_method "textDocument/inlayHint" then
    keymap { "<leader>lI", vim.lsp.inlay_hint.enable, "Toggle inlay hints" }
  end

  keymap { "<leader>lk", vim.diagnostic.open_float, "Line diagnostics" }
  keymap { "<leader>lq", vim.diagnostic.setloclist, "List diagnostic" }
  keymap { "]d", vim.diagnostic.goto_next, "Next diagnostic" }
  keymap { "[d", vim.diagnostic.goto_prev, "Previous diagnostic" }
end

function M.setup_lspconfig(servers)
  local default_handlers = {
    on_attach = on_attach,
    capabilities = setup_lsp_capabilities(),
  }

  for server, server_opts in pairs(servers) do
    if server_opts then
      require("lspconfig")[server].setup(vim.tbl_deep_extend("force", default_handlers, server_opts))
    else
      require("lspconfig")[server].setup(default_handlers)
    end
  end
end

return M
