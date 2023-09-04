local init = function()
  local rainbow_delimiters = require "rainbow-delimiters"
  vim.g.rainbow_delimiters = {
    strategy = {
      [""] = rainbow_delimiters.strategy["global"],
    },
    blacklist = { "c", "cpp" },
  }
end

require("utils").lazy {
  event = { "BufReadPost", "BufNewFile" },
  pack = "rainbow-delimiters.nvim",
  name = "rainbow-delimiters",
  setup = false,
  init = init,
}
