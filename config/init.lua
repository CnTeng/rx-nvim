vim.opt.rtp:prepend(vim.g.lazy_path)
vim.opt.rtp:append(vim.g.config_path)

require "core"

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
