---@type LazyPluginSpec
return {
  "neovim/nvim-lspconfig",
  opts = {
    servers = { dockerls = {} },
  },
}
