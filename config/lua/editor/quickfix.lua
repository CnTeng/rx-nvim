return {
  ---@type LazyPluginSpec
  {
    "kevinhwang91/nvim-bqf",
    dependencies = "junegunn/fzf",
    ft = "qf",
    opts = {
      auto_resize_height = true,
    },
  },

  {
    "stevearc/quicker.nvim",
    ft = "qf",
    opts = {
      keys = {
        {
          "zo",
          function()
            require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
          end,
          desc = "Expand quickfix context",
        },
        {
          "zc",
          function()
            require("quicker").collapse()
          end,
          desc = "Collapse quickfix context",
        },
      },
    },
  },
}
