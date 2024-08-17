---@type LazyPluginSpec
return {
  "folke/flash.nvim",
  keys = {
    {
      mode = { "n", "x", "o" },
      "s",
      function()
        require("flash").jump()
      end,
      desc = "Flash",
    },
    {
      mode = { "n", "x", "o" },
      "S",
      function()
        require("flash").treesitter()
      end,
      desc = "Flash Treesitter",
    },
  },
  opts = {
    modes = {
      treesitter = {
        label = { rainbow = { enabled = true } },
      },
    },
  },
}
