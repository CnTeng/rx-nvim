return {
  "folke/flash.nvim",
  event = "VeryLazy",
  keys = {
    { mode = { "n", "x", "o" }, "s", function() require("flash").jump() end, desc = "Flash" },
    {
      mode = { "n", "o", "x" },
      "S",
      function() require("flash").treesitter { label = { rainbow = { enabled = true } } } end,
      desc = "Flash Treesitter",
    },
    { mode = "o", "r", function() require("flash").remote() end, desc = "Remote Flash" },
    { mode = { "o", "x" }, "R", function() require("flash").freesitter_search() end, desc = "Treesitter Search" },
    { mode = { "c" }, "<c-s>", function() require("flash").toggle() end, desc = "Toggle Flash Search" },
  },
  opts = {
    search = { enabled = false },
    char = { enabled = false },
  },
}
