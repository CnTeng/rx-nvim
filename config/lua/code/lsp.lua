---@module "lz.n"
---@type lz.n.Spec
return {
  { "SchemaStore.nvim", lazy = true },

  {
    "nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile", "BufWritePre" },
    before = function()
      require("lz.n").trigger_load("SchemaStore.nvim")
    end,
    after = function()
      vim.lsp.enable({
        "basedpyright",
        "bashls",
        "biome",
        "clangd",
        "copilot",
        "dockerls",
        "golangci_lint_ls",
        "gopls",
        "jsonls",
        "lua_ls",
        "neocmake",
        "nil_ls",
        "ruff",
        "rust_analyzer",
        "tailwindcss",
        "taplo",
        "tofu_ls",
        "tsgo",
        "yamlls",
      })
    end,
  },

  {
    "outline.nvim",
    keys = {
      {
        "<leader>lo",
        function()
          require("outline").toggle()
        end,
        desc = "Toggle outline",
      },
    },
    after = function()
      require("outline").setup({})
    end,
  },

  {
    "lazydev.nvim",
    ft = "lua",
    before = function()
      require("lz.n").trigger_load("blink.cmp")
    end,
    after = function()
      require("blink-cmp").add_source_provider("lazydev", {
        name = "LazyDev",
        module = "lazydev.integrations.blink",
        score_offset = 100,
      })
      require("blink-cmp").add_filetype_source("lua", "lazydev")

      require("lazydev").setup({
        library = {
          { path = "${3rd}/luv/library", words = { "vim%.uv" } },
          { path = "snacks.nvim", words = { "Snacks", "snacks" } },
        },
      })
    end,
  },
}
