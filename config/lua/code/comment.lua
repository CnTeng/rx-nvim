---@module "lz.n"
---@type lz.n.Spec
return {
  "comment.nvim",
  event = { "BufReadPre", "BufNewFile", "BufWritePre" },
  beforeAll = function()
    vim.keymap.del("n", "gcc")
  end,
  after = function()
    ---@diagnostic disable-next-line: missing-fields
    require("Comment").setup({
      ---@diagnostic disable-next-line: missing-fields
      mappings = { extra = false },
    })
  end,
}
