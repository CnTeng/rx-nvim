---@type LazyPluginSpec
return {
  "saghen/blink.cmp",
  dependencies = "rafamadriz/friendly-snippets",
  event = "InsertEnter",
  opts = {
    keymap = { preset = "enter" },
    completion = {
      list = {
        selection = {
          preselect = function(ctx)
            return ctx.mode ~= "cmdline" and not require("blink.cmp").snippet_active({ direction = 1 })
          end,
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 0,
        update_delay_ms = 0,
      },
    },
    signature = { enabled = true },
    cmdline = {
      completion = {
        menu = { auto_show = true },
      },
    },
  },
}
