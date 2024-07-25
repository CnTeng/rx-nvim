return {
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    init = function()
      vim.filetype.add({
        extension = { ["http"] = "http" },
      })
    end,
    keys = function()
      local kulala = require("kulala")
      return {
        { "<leader>rr", kulala.run, desc = "Send the request" },
        { "<leader>rt", kulala.toggle_view, desc = "Toggle headers/body" },
        { "<leader>rp", kulala.jump_prev, desc = "Jump to previous request" },
        { "<leader>rn", kulala.jump_next, desc = "Jump to next request" },
      }
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
