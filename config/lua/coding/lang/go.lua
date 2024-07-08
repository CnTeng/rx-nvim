return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = {
      gopls = {
        settings = {
          gopls = {
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
      },
      golangci_lint_ls = {},
    },
  },
}
