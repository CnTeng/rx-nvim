---@type LazyPluginSpec
return {
  "Shatur/neovim-session-manager",
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
  opts = function()
    local config = require("session_manager.config")
    return {
      autoload_mode = config.AutoloadMode.Disabled,
    }
  end,
  keys = {
    { "<leader>ss", "<cmd>SessionManager load_session<cr>", desc = "Load session" },
    { "<leader>sl", "<cmd>SessionManager load_last_session<cr>", desc = "Load last session" },
    { "<leader>sc", "<cmd>SessionManager load_current_dir_session<cr>", desc = "Load current dir session" },
    { "<leader>sd", "<cmd>SessionManager delete_session<cr>", desc = "Delete session" },
  },
}
