---@type LazyPluginSpec
return {
  "ribru17/bamboo.nvim",
  priority = 1000,
  config = function()
    require("bamboo").load()
  end,
}
