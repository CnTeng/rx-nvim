return {
  {
    "zbirenbaum/copilot.lua",
    opts = {},
  },
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    keys = {
      {
        "<leader>cch",
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.fzflua").pick(actions.help_actions())
        end,
        desc = "CopilotChat - Help actions",
      },
      {
        "<leader>ccp",
        function()
          local actions = require "CopilotChat.actions"
          require("CopilotChat.integrations.fzflua").pick(actions.prompt_actions())
        end,
        desc = "CopilotChat - Prompt actions",
      },
    },
    opts = {
      mappings = {
        complete = {
          insert = "",
        },
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)

      require("CopilotChat.integrations.cmp").setup()
    end,
  },
}
