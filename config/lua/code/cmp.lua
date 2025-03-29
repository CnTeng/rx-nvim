---@type LazyPluginSpec[]
return {
  {
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
        },
      },

      sources = {
        per_filetype = {
          lua = { "lazydev", "lsp", "path", "snippets", "buffer" },
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
        },
      },

      signature = { enabled = true },

      cmdline = {
        completion = {
          menu = { auto_show = true },
        },
      },
    },
  },

  {
    "folke/lazydev.nvim",
    ft = "lua",
    opts = {
      library = {
        { path = "${3rd}/luv/library", words = { "vim%.uv" } },
        { path = "lazy.nvim", words = { "Lazy" } },
      },
    },
  },
}
