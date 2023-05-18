require("core.utils").lazy_plugin {
  events = { "BufReadPre", "BufNewFile" },
  pattern = "*.md",
  callback = function() vim.cmd.packadd "markdown-preview.nvim" end,
}
