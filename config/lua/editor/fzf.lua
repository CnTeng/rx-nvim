return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "FzfLua" },
  keys = function()
    local fzf_lua = require("fzf-lua")
    return {
      { "<leader>fr", fzf_lua.oldfiles, desc = "Recent files" },
      { "<leader>ff", fzf_lua.files, desc = "Find files" },
      -- Search
      { "<leader>b", fzf_lua.buffers, desc = "Buffers" },
      { "<leader>sc", fzf_lua.commands, desc = "Commands" },
      { "<leader>sC", fzf_lua.command_history, desc = "Command history" },
      { "<leader>sh", fzf_lua.help_tags, desc = "Help pages" },
      { "<leader>sH", fzf_lua.highlights, desc = "Highlight groups" },
      { "<leader>sk", fzf_lua.keymaps, desc = "Key maps" },
      { "<leader>sm", fzf_lua.man_pages, desc = "Man pages" },
      { "<leader>sr", fzf_lua.registers, desc = "Registers" },
      { "<leader>su", fzf_lua.grep_cword, desc = "Current word" },
      { "<leader>sw", fzf_lua.live_grep_native, desc = "Word" },
      -- Git
      { "<leader>gt", fzf_lua.git_status, desc = "Git status" },
      { "<leader>gb", fzf_lua.git_branches, desc = "Git branches" },
      { "<leader>gc", fzf_lua.git_commits, desc = "Git commits" },
    }
  end,
  opts = { "borderless_full" },
}
