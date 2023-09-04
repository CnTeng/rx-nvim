local keys = {
  { "<leader>gg", function() require("neogit").open() end, "Neogit" },
}

require("utils").lazy {
  name = "neogit",
  pack = "neogit",
  keys = keys,
  config = true,
}
