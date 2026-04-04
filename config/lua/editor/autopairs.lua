---@module "lz.n"
---@type lz.n.Spec
return {
  "ultimate-autopair.nvim",
  event = { "InsertEnter", "CmdlineEnter" },
  after = function()
    require("ultimate-autopair").setup({
      tabout = {
        enable = true,
        map = "<Tab>",
        hopout = true,
        do_nothing_if_fail = false,
      },
    })
  end,
}
