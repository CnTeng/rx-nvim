---@module "lz.n"
---@type lz.n.Spec
return {
  "auto-session",
  event = "DeferredUIEnter",
  keys = {
    { "<leader>sr", "<cmd>AutoSession search<cr>", desc = "Recent session" },
    { "<leader>ss", "<cmd>AutoSession save<cr>", desc = "Save session" },
    { "<leader>sd", "<cmd>AutoSession deletePicker<cr>", desc = "Delete session" },
  },
  after = function()
    require("auto-session").setup({
      auto_restore = false,
      bypass_save_filetypes = { "alpha" },
    })
  end,
}
