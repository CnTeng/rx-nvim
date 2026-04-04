---@module "lz.n"
---@type lz.n.Spec
return {
  { "friendly-snippets", lazy = true },

  {
    "blink.cmp",
    event = { "CmdlineEnter", "InsertEnter" },
    before = function()
      require("lz.n").trigger_load("friendly-snippets")
    end,
    after = function()
      require("blink.cmp").setup({
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
        sources = {
          per_filetype = {
            lua = { inherit_defaults = true },
          },
        },
        cmdline = {
          completion = {
            list = {
              selection = { preselect = false },
            },
            menu = { auto_show = true },
          },
        },
      })
    end,
  },
}
