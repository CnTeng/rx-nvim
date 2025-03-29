--- @type vim.lsp.Config
return {
  cmd = { "lua-language-server" },
  filetypes = { "lua" },
  root_markers = {
    ".luarc.json",
    ".luarc.jsonc",
    ".stylua.toml",
    "stylua.toml",
    ".git",
  },
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
