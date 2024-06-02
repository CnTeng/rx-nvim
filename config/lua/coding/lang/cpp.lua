return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          keys = {
            { "<leader>ls", "<cmd>ClangdSwitchSourceHeader<cr>", desc = "Switch between source/header" },
            { "<leader>lt", "<cmd>ClangdAST<cr>", desc = "View AST" },
          },

          callback = function()
            local cmp = require "cmp"
            cmp.setup {
              sorting = {
                comparators = {
                  cmp.config.compare.offset,
                  cmp.config.compare.exact,
                  cmp.config.compare.recently_used,
                  require "clangd_extensions.cmp_scores",
                  cmp.config.compare.kind,
                  cmp.config.compare.sort_text,
                  cmp.config.compare.length,
                  cmp.config.compare.order,
                },
              },
            }
          end,

          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--header-insertion=iwyu",
          },
        },

        cmake = {},
      },
    },
  },
  {
    "Civitasv/cmake-tools.nvim",
    lazy = true,
    ft = { "c", "cpp" },
    opts = {},
  },
  {
    "p00f/clangd_extensions.nvim",
    ft = { "c", "cpp" },
    opts = {
      ast = {
        role_icons = {
          type = "",
          declaration = "",
          expression = "",
          specifier = "",
          statement = "",
          ["template argument"] = "",
        },

        kind_icons = {
          Compound = "",
          Recovery = "",
          TranslationUnit = "",
          PackExpansion = "",
          TemplateTypeParm = "",
          TemplateTemplateParm = "",
          TemplateParamObject = "",
        },
      },
    },
  },
}
