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
    keys = function()
      local function fzflua_opts(title)
        return {
          prompt = false,
          winopts = {
            height = 0.40,
            width = 0.60,
            title = " CopilotChat " .. title .. " ",
            title_pos = "center",
            preview = { hidden = "hidden" },
          },
        }
      end

      return {
        {
          mode = { "n", "v" },
          "<leader>aa",
          function()
            require("CopilotChat").toggle()
          end,
          desc = "Chat",
        },
        {
          mode = { "n", "v" },
          "<leader>ac",
          function()
            require("CopilotChat").reset()
          end,
          desc = "Chat clear",
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
          "<leader>ah",
          function()
            local actions = require("CopilotChat.actions")
            local fzflua = require("CopilotChat.integrations.fzflua")
            fzflua.pick(actions.help_actions(), fzflua_opts("Help"))
          end,
          desc = "Help actions",
        },
        {
          mode = { "n", "v" },
          "<leader>ap",
          function()
            local actions = require("CopilotChat.actions")
            local fzflua = require("CopilotChat.integrations.fzflua")
            fzflua.pick(actions.prompt_actions(), fzflua_opts("Prompt"))
          end,
          desc = "Prompt actions",
        },
      }
    end,
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
