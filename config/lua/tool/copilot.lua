return {
  ---@type LazyPluginSpec
  {
    "github/copilot.vim",
    event = "VeryLazy",
    init = function()
      vim.g.copilot_no_tab_map = true
    end,
    keys = {
      {
        mode = "i",
        "<C-j>",
        'copilot#Accept("<CR>")',
        expr = true,
        silent = true,
        replace_keycodes = false,
      },
      { mode = "i", "<C-l>", "<Plug>(copilot-accept-word)" },
    },
  },

  {
    "ofseed/copilot-status.nvim",
    event = "VeryLazy",
    dependencies = { "github/copilot.vim" },
  },

  {
    "CopilotC-Nvim/CopilotChat.nvim",
    dependencies = {
      { "github/copilot.vim" },
      { "nvim-lua/plenary.nvim" },
    },
    keys = function()
      local CopilotChat = require("CopilotChat")
      local actions = require("CopilotChat.actions")
      local fzflua = require("CopilotChat.integrations.fzflua")

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
        { mode = { "n", "v" }, "<leader>aa", CopilotChat.toggle, desc = "Chat" },
        { mode = { "n", "v" }, "<leader>ac", CopilotChat.reset, desc = "Chat clear" },
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
            fzflua.pick(actions.help_actions(), fzflua_opts("Help"))
          end,
          desc = "Help actions",
        },

        {
          mode = { "n", "v" },
          "<leader>ap",
          function()
            fzflua.pick(actions.prompt_actions(), fzflua_opts("Prompt"))
          end,
          desc = "Prompt actions",
        },
      }
    end,
    opts = {
      mappings = {
        complete = {
          insert = "",
        },
        close = {
          normal = "<C-q>",
        },
        reset = {
          normal = "<C-d>",
          insert = "<C-d>",
        },
      },
    },
    config = function(_, opts)
      require("CopilotChat").setup(opts)

      require("CopilotChat.integrations.cmp").setup()
    end,
  },
}
