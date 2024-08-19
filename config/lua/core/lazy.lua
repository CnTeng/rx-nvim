local event = require("lazy.core.handler.event")

event.mappings.LazyFile = { id = "LazyFile", event = { "BufReadPost", "BufNewFile", "BufWritePre" } }
event.mappings["User LazyFile"] = event.mappings.LazyFile

require("lazy").setup({
  defaults = {
    cond = vim.env.KITTY_SCROLLBACK_NVIM ~= "true",
  },
  spec = {
    { import = "code" },
    { import = "code.lang" },
    { import = "editor" },
    { import = "git" },
    { import = "tool" },
    { import = "ui" },
  },
  rocks = { enabled = false },
  ---@diagnostic disable-next-line: assign-type-mismatch
  dev = {
    path = vim.g.plugins_path,
    patterns = { "." },
  },
  performance = {
    rtp = {
      paths = { vim.g.config_path },
    },
  },
})
