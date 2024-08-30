---@type LazyPluginSpec
return {
  "ibhagwan/fzf-lua",
  dependencies = "nvim-tree/nvim-web-devicons",
  cmd = { "FzfLua" },
  keys = {
    -- Buffers
    {
      "<leader>b",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "Buffers",
    },

    -- Files
    {
      "<leader>ff",
      function()
        require("fzf-lua").files()
      end,
      desc = "Files",
    },
    {
      "<leader>fr",
      function()
        require("fzf-lua").oldfiles()
      end,
      desc = "Recent files",
    },

    -- Text
    {
      "<leader>fw",
      function()
        require("fzf-lua").live_grep_native()
      end,
      desc = "Word",
    },
    {
      "<leader>fu",
      function()
        require("fzf-lua").grep_cword()
      end,
      desc = "Current word",
    },

    -- Git
    {
      "<leader>gc",
      function()
        require("fzf-lua").git_commits()
      end,
      desc = "Commits",
    },
    {
      "<leader>gb",
      function()
        require("fzf-lua").git_branches()
      end,
      desc = "Branches",
    },
    {
      "<leader>gt",
      function()
        require("fzf-lua").git_tags()
      end,
      desc = "Tags",
    },

    -- Lsp
    {
      "<leader>fs",
      function()
        require("fzf-lua").lsp_document_symbols()
      end,
      desc = "Document symbols",
    },
    {
      "<leader>fS",
      function()
        require("fzf-lua").lsp_workspace_symbols()
      end,
      desc = "Workspace symbols",
    },

    -- Misc
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
      "<leader>fm",
      function()
        require("fzf-lua").marks()
      end,
      desc = "Marks",
    },
    {
      "<leader>fj",
      function()
        require("fzf-lua").jumps()
      end,
      desc = "Jumps",
    },
    {
      "<leader>fR",
      function()
        require("fzf-lua").registers()
      end,
      desc = "Registers",
    },
    {
      "<leader>fk",
      function()
        require("fzf-lua").keymaps()
      end,
      desc = "Keymaps",
    },
    {
      "<leader>fh",
      function()
        require("fzf-lua").help_tags()
      end,
      desc = "Help tags",
    },
  },
  opts = { "borderless_full" },
}
