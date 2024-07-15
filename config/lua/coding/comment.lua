return {
  "numToStr/Comment.nvim",
  name = "comment.nvim",
  init = function()
    vim.keymap.del("n", "gcc")
  end,
  event = "LazyFile",
  opts = {
    mappings = { extra = false },
  },
}
