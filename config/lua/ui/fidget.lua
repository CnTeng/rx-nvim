---@module "lz.n"
---@type lz.n.Spec
return {
  "fidget.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("fidget").setup({
      notification = {
        override_vim_notify = true,
        window = { winblend = 0 },
      },
    })
  end,
}
