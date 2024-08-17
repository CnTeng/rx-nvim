---@type LazyPluginSpec
return {
  "ibhagwan/fzf-lua",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = { "FzfLua" },
  keys = {
    -- Find
    {
      "<leader>fr",
      function()
        require("fzf-lua").oldfiles()
      end,
      desc = "Recent files",
    },
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "Find files",
    },
    {
      "<leader>b",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "Buffers",
    },
    {
      "<leader>fc",
      function()
        require("fzf-lua").commands()
      end,
      desc = "Commands",
    },
    {
      "<leader>fC",
      function()
        require("fzf-lua").command_history()
      end,
      desc = "Command history",
    },
    {
      "<leader>fh",
      function()
        require("fzf-lua").help_tags()
      end,
      desc = "Help pages",
    },
    {
      "<leader>fH",
      function()
        require("fzf-lua").highlights()
      end,
      desc = "Highlight groups",
    },
    {
      "<leader>fk",
      function()
        require("fzf-lua").keymaps()
      end,
      desc = "Key maps",
    },
    {
      "<leader>fm",
      function()
        require("fzf-lua").man_pages()
      end,
      desc = "Man pages",
    },
    {
      "<leader>fR",
      function()
        require("fzf-lua").registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>fu",
      function()
        require("fzf-lua").grep_cword()
      end,
      desc = "Current word",
    },
    {
      "<leader>fw",
      function()
        require("fzf-lua").live_grep_native()
      end,
      desc = "Word",
    },

    -- Git
    {
      "<leader>gt",
      function()
        require("fzf-lua").git_status()
      end,
      desc = "Git status",
    },
    {
      "<leader>gb",
      function()
        require("fzf-lua").git_branches()
      end,
      desc = "Git branches",
    },
    {
      "<leader>gc",
      function()
        require("fzf-lua").git_commits()
      end,
      desc = "Git commits",
    },
  },
  opts = { "borderless_full" },
}
