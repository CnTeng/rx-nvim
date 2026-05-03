---@module "lz.n"
---@type lz.n.Spec
return {
  "dropbar.nvim",
  event = { "BufReadPre", "BufNewFile", "BufWritePre" },
  after = function()
    require("dropbar").setup()
  end,
}
