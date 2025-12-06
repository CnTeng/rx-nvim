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
    init = function()
      vim.api.nvim_create_autocmd("User", {
        pattern = "FugitiveCommit",
        callback = function()
          vim.opt_local.foldmethod = "syntax"
        end,
      })
    end,
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
