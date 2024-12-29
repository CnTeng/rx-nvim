---@type LazyPluginSpec[]
return {
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
          args = function()
            return coroutine.create(function(dap_run_co)
              local args = {}
              vim.ui.input({ prompt = "Args: " }, function(input)
                args = vim.split(input or "", " ")
                coroutine.resume(dap_run_co, args)
              end)
            end)
          end,
        },
      },
    },
  },
}
