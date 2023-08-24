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
  { "n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "ToggleTerm float" } },
  { "n", "<leader>th", "<cmd>ToggleTerm size=10 direction=horizontal<cr>", { desc = "ToggleTerm horizontal split" } },
  { "n", "<leader>tv", "<cmd>ToggleTerm size=80 direction=vertical<cr>", { desc = "ToggleTerm vertical split" } },
  {
    "n",
    "<leader>tg",
    function() require("toggleterm.terminal").Terminal:new({ cmd = "lazygit", hidden = true }):toggle() end,
    { desc = "Lazygit" },
  },

  {
    "n",
    "<leader>tl",
    function() require("toggleterm.terminal").Terminal:new({ cmd = "lf", hidden = true }):toggle() end,
    { desc = "lf" },
  },
}

require("utils.plugin").load { name = "toggleterm", opts = opts, keys = keys }
