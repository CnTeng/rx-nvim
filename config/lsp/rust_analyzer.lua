--- @type vim.lsp.Config
return {
  cmd = { "rust-analyzer" },
  filetypes = { "rust" },
  root_markers = { "rust-project.json", "Cargo.toml", ".git" },
  capabilities = {
    experimental = {
      serverStatusNotification = true,
    },
  },
}
