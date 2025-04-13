--- @type vim.lsp.Config
return {
  settings = {
    Lua = {
      codeLens = { enable = true },
      format = { enable = false },
      hint = { enable = true },
      runtime = { version = "LuaJIT" },
      workspace = { checkThirdParty = false },
    },
  },
}
