return {
  ---@type LazyPluginSpec
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        clangd = {
          keys = {
            { "n", "<leader>cs", "<cmd>ClangdSwitchSourceHeader<cr>", { desc = "Switch between source/header" } },
            { "n", "<leader>ct", "<cmd>ClangdAST<cr>", { desc = "View AST" } },
          },

          cmd = {
            "clangd",
            "--background-index",
            "--clang-tidy",
            "--completion-style=detailed",
            "--function-arg-placeholders",
            "--header-insertion=iwyu",
          },

          capabilities = {
            offsetEncoding = { "utf-16" },
          },
        },

        cmake = {},
      },
    },
  },

  {
    "hrsh7th/nvim-cmp",
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.sorting = {
        comparators = {
          cmp.config.compare.offset,
          cmp.config.compare.exact,
          cmp.config.compare.recently_used,
          require("clangd_extensions.cmp_scores"),
          cmp.config.compare.kind,
          cmp.config.compare.sort_text,
          cmp.config.compare.length,
          cmp.config.compare.order,
        },
      }
    end,
  },

  {
    "Civitasv/cmake-tools.nvim",
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

  {
    "mfussenegger/nvim-dap",
    opts = {
      adapters = {
        codelldb = {
          type = "server",
          port = "${port}",
          executable = {
            command = "lldb-dap",
            args = { "--port", "${port}" },
          },
        },
        gdb = {
          type = "executable",
          command = "gdb",
          args = { "-i", "dap", "-q" },
        },
      },

      configurations = {
        c = {
          {
            name = "lldb: Launch file",
            type = "codelldb",
            request = "launch",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopOnEntry = false,
          },
          {
            name = "lldb: Attach to process",
            type = "codelldb",
            request = "attach",
            pid = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },

          {
            name = "gdb: Launch file",
            type = "gdb",
            request = "launch",
            program = function()
              return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
            end,
            cwd = "${workspaceFolder}",
            stopAtBeginningOfMainSubprogram = false,
          },
          {
            name = "gdb: Attach to process",
            type = "gdb",
            request = "attach",
            pid = require("dap.utils").pick_process,
            cwd = "${workspaceFolder}",
          },
        },
      },
    },
  },
}
