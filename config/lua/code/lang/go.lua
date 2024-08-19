return {
  ---@type LazyPluginSpec
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        gopls = {
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
        },
        golangci_lint_ls = {},
      },
    },
  },

  {
    "leoluz/nvim-dap-go",
    ft = "go",
    opts = {
      dap_configurations = {
        {
          type = "go",
          name = "Debug main.go",
          request = "launch",
          program = "${workspaceFolder}/main.go",
        },
      },
    },
  },
}
