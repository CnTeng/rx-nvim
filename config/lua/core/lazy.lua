local event = require "lazy.core.handler.event"

event.mappings.LazyFile = { id = "LazyFile", event = { "BufReadPost", "BufNewFile", "BufWritePre" } }
event.mappings["User LazyFile"] = event.mappings.LazyFile

require("lazy").setup {
  dev = {
    path = vim.g.plugins_path,
    patterns = { "." },
    fallback = false,
  },
  spec = {
    { import = "coding.lang" },
    { import = "coding" },
    { import = "editor" },
    { import = "ui" },
  },
  performance = {
    rtp = { paths = { vim.g.config_path } },
  },
}
