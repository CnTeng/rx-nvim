local build_tags = {}
for tag in (os.getenv("GO_BUILD_TAGS") or ""):gmatch("%S+") do
  table.insert(build_tags, "-tags")
  table.insert(build_tags, tag)
end

--- @type vim.lsp.Config
return {
  settings = {
    gopls = {
      buildFlags = build_tags,
      gofumpt = true,
      semanticTokens = true,
      usePlaceholders = true,
      staticcheck = true,
      hints = {
        compositeLiteralFields = true,
        compositeLiteralTypes = true,
        constantValues = true,
        functionTypeParameters = true,
        parameterNames = true,
      },
    },
  },
}
