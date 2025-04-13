--- @type vim.lsp.Config
return {
  settings = {
    gopls = {
      gofumpt = true,
      semanticTokens = true,
      usePlaceholders = true,
      staticcheck = true,
      hints = {
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
      },
    },
  },
}
