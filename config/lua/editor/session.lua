---@type LazyPluginSpec
return {
  "rmagatti/auto-session",
  event = "VeryLazy",
  keys = {
    { "<leader>sr", "<cmd>AutoSession search<cr>", desc = "Recent session" },
    { "<leader>ss", "<cmd>AutoSession save<cr>", desc = "Save session" },
    { "<leader>sd", "<cmd>AutoSession deletePicker<cr>", desc = "Delete session" },
  },
  opts = {
    auto_restore = false,
    bypass_save_filetypes = { "alpha" },
  },
}
