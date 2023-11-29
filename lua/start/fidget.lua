local opts = {
  notification = {
    override_vim_notify = true,
    window = { winblend = 0 },
  },
}

require("utils").lazy {
  name = "fidget",
  lazy = false,
  opts = opts,
}
