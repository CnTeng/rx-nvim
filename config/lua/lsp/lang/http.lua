return {
  ---@type LazyPluginSpec
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "http",
        callback = function(args)
          local bufnr = args.buf
          local keymap = vim.keymap.set
          local kulala = require("kulala")
          keymap("n", "<localleader>r", kulala.run, { buffer = bufnr, desc = "Send request" })
          keymap("n", "<localleader>t", kulala.toggle_view, { buffer = bufnr, desc = "Toggle view" })
          keymap("n", "[r", kulala.jump_prev, { buffer = bufnr, desc = "Previous request" })
          keymap("n", "]r", kulala.jump_next, { buffer = bufnr, desc = "Next request" })
        end,
      })
    end,
    opts = {},
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        http = { "kulala" },
      },
      formatters = {
        kulala = {
          command = "kulala-fmt",
          args = { "$FILENAME" },
          stdin = false,
        },
      },
    },
  },
}
