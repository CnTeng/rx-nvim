---@module "lz.n"
---@type lz.n.Spec
return {
  "bamboo.nvim",
  priority = 1000,
  after = function()
    require("bamboo").load()
  end,
}
