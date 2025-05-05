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
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      "github/copilot.vim",
      "nvim-lua/plenary.nvim",
    },
    keys = {
      {
        mode = { "n", "v" },
        "<leader>aa",
        function()
          require("CopilotChat").toggle()
        end,
        desc = "Toggle chat",
      },
      {
        mode = { "n", "v" },
        "<leader>ac",
        function()
          require("CopilotChat").stop()
        end,
        desc = "Stop Chat",
      },
      {
        mode = { "n", "v" },
        "<leader>aq",
        function()
          local input = vim.fn.input("Quick Chat: ")
          if input ~= "" then
            require("CopilotChat").ask(input)
          end
        end,
        desc = "Quick chat",
      },
      {
        mode = { "n", "v" },
        "<leader>ap",
        function()
          require("CopilotChat").select_prompt()
        end,
        desc = "select prompt",
      },
      {
        "<leader>am",
        function()
          require("CopilotChat").select_model()
        end,
        desc = "select model",
      },
    },
    opts = {
      mappings = {
        close = {
          normal = "<C-q>",
        },
        reset = {
          normal = "<C-d>",
          insert = "<C-d>",
        },
      },
    },
  },
}
