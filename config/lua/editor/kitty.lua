return {
  "mikesmithgh/kitty-scrollback.nvim",
  cmd = { "KittyScrollbackGenerateKittens", "KittyScrollbackCheckHealth" },
  -- cond = vim.env.KITTY_SCROLLBACK_NVIM == "true",
  event = { "User KittyScrollbackLaunch" },
  init = function()
    vim.opt.foldcolumn = "0"
    vim.opt.signcolumn = "no"
  end,
  opts = {
    -- { keymaps_enabled = false },
    function()
      local api = require("kitty-scrollback.api")
      vim.keymap.set({ "n", "i" }, "<S-CR>", api.execute_command, { desc = "Execute command" })
      vim.keymap.set({ "n", "i" }, "<C-s>", api.paste_command, { desc = "Paste command" })
      vim.keymap.set("v", "<S-CR>", api.execute_visual_command, { desc = "Execute command" })
      vim.keymap.set("v", "<C-s>", api.paste_visual_command, { desc = "Paste command" })
      vim.keymap.set("n", "g?", api.toggle_footer, { desc = "Toggle footer" })
      vim.keymap.set("n", "<Esc>", api.close_or_quit_all, { desc = "Close or quit all" })
      vim.keymap.set({ "n", "i", "t" }, "<C-c>", api.quit_all, { desc = "Quit all" })
    end,
  },
  -- config = function(_, opts)
  --   require("kitty-scrollback").setup(opts)
  -- end,
}
