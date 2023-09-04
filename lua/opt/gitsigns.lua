local opts = {
  signs = {
    add = { text = "┃" },
    change = { text = "┃" },
    delete = { text = "" },
    topdelete = { text = "" },
    changedelete = { text = "┃" },
    untracked = { text = "┃" },
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
  { "]h", function() require("gitsigns").next_hunk() end, "Next hunk" },
  { "[h", function() require("gitsigns").prev_hunk() end, "Previous hunk" },
  { "<leader>gl", function() require("gitsigns").blame_line() end, "View blame" },
  { "<leader>gp", function() require("gitsigns").preview_hunk() end, "Preview hunk" },
  { "<leader>gr", function() require("gitsigns").reset_hunk() end, "Reset hunk" },
  { "<leader>gR", function() require("gitsigns").reset_buffer() end, "Reset buffer" },
  { "<leader>gs", function() require("gitsigns").stage_hunk() end, "Stage hunk" },
  { "<leader>gu", function() require("gitsigns").undo_stage_hunk() end, "Unstage hunk" },
  { "<leader>gd", function() require("gitsigns").diffthis() end, "View diff" },
}

require("utils.plugin").lazy {
  event = { "BufReadPre", "BufNewFile" },
  pack = "gitsigns.nvim",
  name = "gitsigns",
  opts = opts,
  keys = keys,
}
