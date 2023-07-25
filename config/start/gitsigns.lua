local opts = {
  signs = {
    add = { text = "+" },
    change = { text = "~" },
    delete = { text = "_" },
    topdelete = { text = "‾" },
    changedelete = { text = "-" },
    untracked = { text = "~" },
  },
  watch_gitdir = {
    enable = false,
  },
  current_line_blame = true,
  preview_config = {
    border = "none",
  },
}

local keys = {
  { "n", "]h", function() require("gitsigns").next_hunk() end, { desc = "Next hunk" } },
  { "n", "[h", function() require("gitsigns").prev_hunk() end, { desc = "Previous hunk" } },
  { "n", "<leader>gl", function() require("gitsigns").blame_line() end, { desc = "View blame" } },
  { "n", "<leader>gp", function() require("gitsigns").preview_hunk() end, { desc = "Preview hunk" } },
  { "n", "<leader>gr", function() require("gitsigns").reset_hunk() end, { desc = "Reset hunk" } },
  { "n", "<leader>gR", function() require("gitsigns").reset_buffer() end, { desc = "Reset buffer" } },
  { "n", "<leader>gs", function() require("gitsigns").stage_hunk() end, { desc = "Stage hunk" } },
  { "n", "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, { desc = "Unstage hunk" } },
  { "n", "<leader>gd", function() require("gitsigns").diffthis() end, { desc = "View diff" } },
}

require("utils.plugin").load_plugin { name = "gitsigns", opts = opts, keys = keys }
