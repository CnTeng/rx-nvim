---@type LazyPluginSpec
return {
  "sindrets/diffview.nvim",
  cmd = {
    "DiffviewOpen",
    "DiffviewFileHistory",
  },
  keys = {
    { "<leader>gv", "<cmd>DiffviewOpen<cr>", desc = "Diff view" },
    { "<leader>gh", "<cmd>DiffviewFileHistory<cr>", desc = "Diff history" },
  },
  opts = function()
    local actions = require("diffview.actions")

    return {
      enhanced_diff_hl = true,
      keymaps = {
        view = {
          { "n", "q", actions.close, { desc = "Close view" } },
          { "n", "<C-q>", actions.close, { desc = "Close view" } },
        },
      },
    }
  end,
}
