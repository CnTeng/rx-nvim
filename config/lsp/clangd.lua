--- @type vim.lsp.Config
return {
  cmd = {
    "clangd",
    "--background-index",
    "--clang-tidy",
    "--completion-style=detailed",
    "--function-arg-placeholders",
    "--header-insertion=iwyu",
  },
  capabilities = {
    offsetEncoding = { "utf-16" },
  },
}
