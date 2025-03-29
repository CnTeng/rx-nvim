---@type LazyPluginSpec[]
return {
  {
    "hedyhli/outline.nvim",
    keys = {
      {
        "<leader>lo",
        function()
          require("outline").toggle()
        end,
        desc = "Toggle outline",
      },
    },
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
    "akinsho/flutter-tools.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "stevearc/dressing.nvim",
    },
    ft = "dart",
    opts = {
      lsp = {
        color = { enabled = true },
        on_attach = function(_, bufnr)
          vim.keymap.set("n", "<leader>cd", "<cmd>FlutterDevices<cr>", { buffer = bufnr, desc = "Devices" })
          vim.keymap.set("n", "<leader>ce", "<cmd>FlutterEmulators<cr>", { buffer = bufnr, desc = "Emulators" })
          vim.keymap.set("n", "<leader>co", "<cmd>FlutterOutlineOpen<cr>", { buffer = bufnr, desc = "Outline" })
          vim.keymap.set("n", "<leader>cq", "<cmd>FlutterQuit<cr>", { buffer = bufnr, desc = "Quit" })
          vim.keymap.set("n", "<leader>cr", "<cmd>FlutterRun<cr>", { buffer = bufnr, desc = "Run" })
          vim.keymap.set("n", "<leader>cR", "<cmd>FlutterRestart<cr>", { buffer = bufnr, desc = "Restart" })
        end,
      },
    },
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "lazy.nvim", words = { "Lazy" } },
        { path = "snacks.nvim", words = { "Snacks", "snacks" } },
      },
    },
    config = function(_, opts)
      require("blink-cmp").add_source_provider("lazydev", {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      })
      require("blink-cmp").add_filetype_source("lua", "lazydev")

      require("lazydev").setup(opts)
    end,
  },
}
