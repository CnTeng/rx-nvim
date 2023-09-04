local opts = {
  input = { border = "single" },
  select = {
    backend = { "builtin" },
    builtin = {
      title_pos = "left",
      border = "single",
      relative = "cursor",
      min_width = { 20, 0.2 },
      min_height = 3,
    },
  },
}

require("utils").lazy {
  name = "dressing",
  lazy = false,
  opts = opts,
}
