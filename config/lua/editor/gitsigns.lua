return {
  "lewis6991/gitsigns.nvim",
  event = "LazyFile",
  keys = function()
    local gitsigns = require("gitsigns")
    return {
      { "]h", gitsigns.next_hunk, desc = "Next hunk" },
      { "[h", gitsigns.prev_hunk, desc = "Previous hunk" },
      { "<leader>gl", gitsigns.blame_line, desc = "View blame" },
      { "<leader>gp", gitsigns.preview_hunk, desc = "Preview hunk" },
      { "<leader>gr", gitsigns.reset_hunk, desc = "Reset hunk" },
      { "<leader>gR", gitsigns.reset_buffer, desc = "Reset buffer" },
      { "<leader>gs", gitsigns.stage_hunk, desc = "Stage hunk" },
      { "<leader>gu", gitsigns.undo_stage_hunk, desc = "Unstage hunk" },
      { "<leader>gd", gitsigns.diffthis, desc = "View diff" },
    }
  end,
  opts = {
    signs = {
      add = { text = "┃" },
      change = { text = "┃" },
      delete = { text = "" },
      topdelete = { text = "" },
      changedelete = { text = "┃" },
      untracked = { text = "┃" },
    },
    current_line_blame = true,
    preview_config = { border = "none" },
  },
}
