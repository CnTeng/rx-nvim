local build_tags = os.getenv("GO_BUILD_TAGS")
local command = {
  "golangci-lint",
  "run",
  "--output.json.path=stdout",
  "--show-stats=false",
}
if build_tags and build_tags ~= "" then
  table.insert(command, "--build-tags=" .. build_tags)
end

--- @type vim.lsp.Config
return {
  init_options = {
    command = command,
  },
}
