---@module "lz.n"
---@type lz.n.Spec
return {
  {
    "guess-indent.nvim",
    event = { "BufReadPre", "BufNewFile", "BufWritePre" },
    after = function()
      require("guess-indent").setup({})
    end,
  },

  {
    "indent-blankline.nvim",
    event = { "BufReadPre", "BufNewFile", "BufWritePre" },
    after = function()
      require("ibl").setup({
        indent = { char = "▏" },
        scope = {
          char = "▎",
          show_start = false,
          show_end = false,
        },
        exclude = {
          filetypes = { "alpha", "neo-tree" },
        },
      })
    end,
  },
}
