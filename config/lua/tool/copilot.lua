---@module "lz.n"
---@type lz.n.Spec
return {
  "CopilotChat.nvim",
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
      "<leader>ak",
      function()
        vim.ui.input({ prompt = "Ask: " }, function(input)
          require("CopilotChat").ask(input)
        end)
      end,
      desc = "Inline ask",
    },
    {
      mode = { "n", "v" },
      "<leader>ap",
      function()
        require("CopilotChat").select_prompt()
      end,
      desc = "Select prompt",
    },
    {
      "<leader>am",
      function()
        require("CopilotChat").select_model()
      end,
      desc = "Select model",
    },
  },
  after = function()
    require("CopilotChat").setup({
      model = "gpt-5-mini",
      mappings = {
        close = {
          normal = "<C-q>",
          callback = function()
            require("CopilotChat").close()
          end,
        },
        reset = {
          normal = "<C-d>",
          insert = "<C-d>",
          callback = function()
            require("CopilotChat").reset()
          end,
        },
      },
    })
  end,
}
