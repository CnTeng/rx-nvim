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
  { "<leader>tf", "ToggleTerm direction=float", "ToggleTerm float" },
  { "<leader>th", "ToggleTerm size=10 direction=horizontal", "ToggleTerm horizontal split" },
  { "<leader>tv", "ToggleTerm size=80 direction=vertical", "ToggleTerm vertical split" },
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

for _, key in ipairs(keys) do
  require("utils").keymap(key)
end

vim.api.nvim_create_user_command("ToggleTerm", function(opt)
  vim.api.nvim_del_user_command "ToggleTerm"
  vim.cmd.packadd "toggleterm.nvim"

  require("utils.plugin").load {
    name = "toggleterm",
    opts = opts,
    -- keys = keys,
  }

  vim.cmd(opt.name .. " " .. opt.args)
end, {})
