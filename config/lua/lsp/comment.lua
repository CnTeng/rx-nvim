return {
  ---@type LazyPluginSpec
  {
    "numToStr/Comment.nvim",
    name = "comment.nvim",
    init = function()
      vim.keymap.del("n", "gcc")
    end,
    event = "LazyFile",
    opts = {
      mappings = { extra = false },
    },
  },

  {
    "folke/todo-comments.nvim",
    cmd = "TodoQuickFix",
    event = "LazyFile",
    keys = {
      {
        "]t",
        function()
          require("todo-comments").jump_next()
        end,
        desc = "Next todo comment",
      },
      {
        "[t",
        function()
          require("todo-comments").jump_prev()
        end,
        desc = "Previous todo comment",
      },
      {
        "<leader>ft",
        function()
          require("todo-comments.fzf").todo()
        end,
        desc = "Todo comments",
      },
    },
    opts = {},
  },
}
