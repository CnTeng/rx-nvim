---@type LazyPluginSpec
return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  event = { "CmdlineEnter", "InsertEnter" },
  opts = {
    keymap = { preset = "enter" },
    completion = {
      list = {
        selection = {
          preselect = function()
            return not require("blink.cmp").snippet_active({ direction = 1 })
          end,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
      },
    },

    signature = { enabled = true },

    cmdline = {
      completion = {
        list = {
          selection = { preselect = false },
        },
        menu = { auto_show = true },
      },
    },
  },
}
