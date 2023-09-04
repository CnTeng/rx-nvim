local keys = {
  { "<Leader>d", function() require("dapui").toggle() end, "Debug" },
}
require("utils").lazy {
  name = "dapui",
  pack = "nvim-dap-ui",
  keys = keys,
  before = "dap",
  config = true,
}
