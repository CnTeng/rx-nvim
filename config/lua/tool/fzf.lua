---@module "lz.n"
---@type lz.n.Spec
return {
  "fzf-lua",
  cmd = "FzfLua",
  keys = {
    {
      "<leader>b",
      function()
        require("fzf-lua").buffers()
      end,
      desc = "Buffers",
    },
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
    {
      "<leader>ft",
      function()
        require("fzf-lua").grep({
          search = [[\b(TODO|WIP|NOTE|XXX|INFO|DOCS|PERF|TEST|HACK|WARNING|WARN|FIX|FIXME|BUG|ERROR):]],
          no_esc = true,
          multiline = true,
        })
      end,
      desc = "Todo comments",
    },
  },
  beforeAll = function()
    ---@diagnostic disable-next-line: duplicate-set-field
    vim.ui.select = function(...)
      require("lz.n").trigger_load("fzf-lua")
      require("fzf-lua").register_ui_select()
      vim.ui.select(...)
    end
  end,
  before = function()
    require("lz.n").trigger_load("nvim-web-devicons")
  end,
  after = function()
    require("fzf-lua").setup({ "borderless-full" })
  end,
}
