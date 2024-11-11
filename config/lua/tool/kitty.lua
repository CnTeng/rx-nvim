return {
  ---@type LazyPluginSpec
  {
    "mikesmithgh/kitty-scrollback.nvim",
    cond = vim.env.KITTY_SCROLLBACK_NVIM == "true",
    event = { "User KittyScrollbackLaunch" },
    init = function()
      vim.opt.foldcolumn = "0"
      vim.opt.signcolumn = "no"
    end,
    opts = {
      function()
        vim.keymap.set({ "n", "i" }, "<C-s>", "<Plug>(KsbExecuteCmd)", {})
        vim.keymap.set("v", "<C-s>", "<Plug>(KsbExecuteVisualCmd)", {})
      end,
    },
  },

  {
    "willothy/flatten.nvim",
    opts = {
      window = { open = "alternate" },
      one_per = { kitty = true },
    },
  },
}
