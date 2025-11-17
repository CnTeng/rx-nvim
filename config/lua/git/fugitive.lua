---@type LazyPluginSpec[]
return {
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git" },
    keys = {
      { "<leader>gg", "<cmd>Git<cr>", desc = "Status" },
    },
  },

  {
    "rbong/vim-flog",
    dependencies = "tpope/vim-fugitive",
    cmd = "Flog",
    keys = {
      { "<leader>gl", "<cmd>Flog<cr>", desc = "Logs" },
    },
  },
}
