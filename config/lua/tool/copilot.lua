---@type LazyPluginSpec[]
return {
  {
    "github/copilot.vim",
    event = "VeryLazy",
    keys = {
      {
        mode = "i",
        "<C-j>",
        'copilot#Accept("<CR>")',
        expr = true,
        silent = true,
        replace_keycodes = false,
      },
      { mode = "i", "<C-l>", "<Plug>(copilot-accept-word)", desc = "Accept word" },
      {
        "<leader>at",
        function()
          if vim.fn["copilot#Enabled"]() == 1 then
            vim.cmd("Copilot disable")
          else
            vim.cmd("Copilot enable")
          end
          vim.cmd("Copilot status")
        end,
        desc = "Toggle copilot",
      },
    },
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
  },

  {
    "ofseed/copilot-status.nvim",
    dependencies = "github/copilot.vim",
    event = "VeryLazy",
  },

  {
    "olimorris/codecompanion.nvim",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
      "github/copilot.vim",
    },
    cmd = "CodeCompanion",
    keys = {
      { mode = { "n", "v" }, "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", desc = "Toggle chat" },
      { mode = { "n", "v" }, "<leader>an", "<cmd>CodeCompanionChat<cr>", desc = "New chat" },
      { mode = { "n", "v" }, "<leader>ap", "<cmd>CodeCompanionActions<cr>", desc = "Actions" },
      { mode = "v", "ga", ":CodeCompanionChat Add | normal<cr>", desc = "Add to chat" },
    },
    opts = {
      adapters = {
        copilot = function()
          return require("codecompanion.adapters").extend("copilot", {
            schema = {
              model = { default = "claude-3.7-sonnet" },
            },
          })
        end,
      },
    },
  },

  {
    "saghen/blink.cmp",
    opts = {
      sources = {
        per_filetype = {
          codecompanion = { "codecompanion", "buffer" },
        },
      },
    },
  },
}
