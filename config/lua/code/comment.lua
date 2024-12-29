---@type LazyPluginSpec[]
return {
  {
    "numToStr/Comment.nvim",
    name = "comment.nvim",
    event = "LazyFile",
    init = function()
      vim.keymap.del("n", "gcc")
    end,
    opts = {
      mappings = { extra = false },
    },
  },

  {
    "folke/todo-comments.nvim",
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
