---@type LazyPluginSpec[]
return {
  {
    "tpope/vim-fugitive",
    cmd = { "G", "Git", "Gvdiffsplit" },
    keys = {
      { "<leader>gg", "<cmd>Git<cr>", desc = "Status" },
      { "<leader>gd", "<cmd>aboveleft Gvdiffsplit<cr>", desc = "Diff" },
      { "<leader>gD", "<cmd>aboveleft Gvdiffsplit origin<cr>", desc = "Diff (cached)" },
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
