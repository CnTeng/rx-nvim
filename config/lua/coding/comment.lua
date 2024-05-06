return {
  "numToStr/Comment.nvim",
  name = "comment.nvim",
  init = function() vim.keymap.del("n", "gcc") end,
  event = "LazyFile",
  keys = {
    { "gc", mode = { "n", "v" }, desc = "Comment toggle linewise" },
    { "gb", mode = { "n", "v" }, desc = "Comment toggle blockwise" },
  },
  opts = {},
}
