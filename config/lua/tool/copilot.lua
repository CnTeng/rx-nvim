---@type LazyPluginSpec[]
return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = "nvim-lua/plenary.nvim",
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
