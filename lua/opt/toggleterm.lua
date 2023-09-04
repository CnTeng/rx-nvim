local opts = {
  size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
  shading_factor = 2,
  direction = "float",
  float_opts = {
    border = "curved",
    highlights = {
      border = "Normal",
      background = "Normal",
    },
  },
}

local keys = {
  { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", "ToggleTerm float" },
  { "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "ToggleTerm horizontal split" },
  { "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", "ToggleTerm vertical split" },
  {
    "<leader>tg",
    function() require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true }):toggle() end,
    "Lazygit",
  },

  {
    "<leader>tl",
    function() require("toggleterm.terminal").Terminal:new({ cmd = "lf", hidden = true }):toggle() end,
    "lf",
  },
}

require("utils.plugin").lazy {
  name = "toggleterm",
  pack = "toggleterm.nvim",
  opts = opts,
  keys = keys,
}
