---@type LazyPluginSpec
return {
  "numToStr/Comment.nvim",
  name = "comment.nvim",
  event = "LazyFile",
  init = function()
    vim.keymap.del("n", "gcc")
  end,
  opts = {
    mappings = { extra = false },
  },
}
