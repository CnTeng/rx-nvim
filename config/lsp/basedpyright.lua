--- @type vim.lsp.Config
return {
  settings = {
    basedpyright = {
      disableOrganizeImports = true,
    },
    python = {
      analysis = { ignore = { "*" } },
    },
  },
}
