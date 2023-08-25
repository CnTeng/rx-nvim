local opts = {
  input = { border = "single" },
  select = {
    backend = { "fzf_lua", "builtin" },
    builtin = {
      title_pos = "left",
      border = "single",
      relative = "cursor",
      min_width = { 20, 0.2 },
      min_height = 3,
    },
  },
}
require("utils.plugin").load {
  name = "dressing",
  opts = opts,
}
