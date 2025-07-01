---@type LazyPluginSpec
return {
  "akinsho/toggleterm.nvim",
  cmd = "ToggleTerm",
  keys = {
    { "<C-\\>" },
    { "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", desc = "ToggleTerm float" },
    { "<leader>ts", "<cmd>ToggleTerm direction=horizontal<cr>", desc = "ToggleTerm horizontal" },
    { "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", desc = "ToggleTerm vertical" },
  },
  opts = {
    size = function(term)
      if term.direction == "horizontal" then
        return 15
      elseif term.direction == "vertical" then
        return vim.o.columns * 0.4
      end
    end,
    on_create = function(t)
      vim.keymap.set("t", "\\\\", "<C-\\><C-N>", { buffer = t.bufnr, desc = "Exit normal mode" })
    end,
    open_mapping = [[<C-\>]],
    shading_factor = 2,
    direction = "float",
  },
}
