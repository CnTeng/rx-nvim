return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "FzfLua" },
  keys = {
    { "<leader>fr", function() require("fzf-lua").oldfiles() end, desc = "Recent files" },
    { "<leader>ff", function() require("fzf-lua").files() end, desc = "Find files" },
    -- Search
    { "<leader>b", function() require("fzf-lua").buffers() end, desc = "Buffers" },
    { "<leader>sc", function() require("fzf-lua").commands() end, desc = "Commands" },
    { "<leader>sC", function() require("fzf-lua").command_history() end, desc = "Command history" },
    { "<leader>sh", function() require("fzf-lua").help_tags() end, desc = "Help pages" },
    { "<leader>sH", function() require("fzf-lua").highlights() end, desc = "Highlight groups" },
    { "<leader>sk", function() require("fzf-lua").keymaps() end, desc = "Key maps" },
    { "<leader>sm", function() require("fzf-lua").man_pages() end, desc = "Man pages" },
    { "<leader>sr", function() require("fzf-lua").registers() end, desc = "Registers" },
    { "<leader>su", function() require("fzf-lua").grep_cword() end, desc = "Current word" },
    { "<leader>sw", function() require("fzf-lua").live_grep_native() end, desc = "Word" },
    -- Git
    { "<leader>gt", function() require("fzf-lua").git_status() end, desc = "Git status" },
    { "<leader>gb", function() require("fzf-lua").git_branches() end, desc = "Git branches" },
    { "<leader>gc", function() require("fzf-lua").git_commits() end, desc = "Git commits" },
  },
  opts = { "borderless_full" },
}
