---@module "lz.n"
---@type lz.n.Spec
return {
  { "fzf", lazy = true },

  {
    "nvim-bqf",
    ft = "qf",
    before = function()
      require("lz.n").trigger_load("fzf")
    end,
    after = function()
      require("bqf").setup({
        auto_resize_height = true,
      })
    end,
  },

  {
    "quicker.nvim",
    ft = "qf",
    after = function()
      require("quicker").setup({
        keys = {
          {
            "zo",
            function()
              require("quicker").expand({ before = 2, after = 2, add_to_existing = true })
            end,
            desc = "Expand quickfix context",
          },
          {
            "zc",
            function()
              require("quicker").collapse()
            end,
            desc = "Collapse quickfix context",
          },
        },
      })
    end,
  },
}
