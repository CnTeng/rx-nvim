local M = {}

local function has(client, method)
  method = method:find("/") and method or "textDocument/" .. method
  return client.supports_method(method)
end

function M.capabilities(extra_caps)
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

function M.on_attach(check_method, extra_keys)
  local keys = require("lazy.core.handler.keys")

  local spec = vim.deepcopy(require("utils.lazy").opts("nvim-lspconfig").keys)

  if extra_keys then
    vim.list_extend(spec, extra_keys)
  end

  return function(client, bufnr)
    if not check_method or has(client, "inlayHint") then
      vim.lsp.inlay_hint.enable()
    end

    local keymaps = keys.resolve(spec)
    for _, keymap in pairs(keymaps) do
      ---@diagnostic disable-next-line: undefined-field
      if not check_method or not keymap.has or has(client, keymap.has) then
        local opts = keys.opts(keymap)
        ---@diagnostic disable-next-line: inject-field
        opts.has = nil
        ---@diagnostic disable-next-line: inject-field
        opts.silent = opts.silent ~= false
        ---@diagnostic disable-next-line: inject-field
        opts.buffer = bufnr
        ---@diagnostic disable-next-line: param-type-mismatch
        vim.keymap.set(keymap.mode or "n", keymap.lhs, keymap.rhs, opts)
      end
    end
  end
end

function M.handlers(server_opts)
  local handlers = {
    capabilities = M.capabilities(server_opts.capabilities),
    on_attach = M.on_attach(true, server_opts.keys),
  }

  if server_opts then
    handlers = vim.tbl_deep_extend("force", handlers, server_opts)
  end

  return handlers
end

return M
