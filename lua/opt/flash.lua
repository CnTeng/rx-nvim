local keys = {
  { mode = { "n", "x", "o" }, "s", function() require("flash").jump() end, "Flash" },
  {
    mode = { "n", "o", "x" },
    "S",
    function() require("flash").treesitter { label = { rainbow = { enabled = true } } } end,
    "Flash Treesitter",
  },
  { mode = "o", "r", function() require("flash").remote() end, "Remote Flash" },
  { mode = { "o", "x" }, "R", function() require("flash").freesitter_search() end, "Treesitter Search" },
  { mode = { "c" }, "<c-s>", function() require("flash").toggle() end, "Toggle Flash Search" },
}

require("utils").lazy {
  pack = "flash.nvim",
  name = "flash",
  keys = keys,
  config = true,
}
