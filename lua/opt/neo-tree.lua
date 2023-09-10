local opts = {
  sources = { "filesystem", "buffers", "git_status", "document_symbols" },
  close_if_last_window = true,
  default_component_configs = {
    indent = {
      indent_size = 2,
      padding = 0,
      with_expanders = true,
    },
    name = { highlight_opened_files = true },
  },
  window = {
    width = 30,
    mappings = {
      ["<space>"] = "noop",
      ["<cr>"] = "noop",
      ["l"] = "open",
      ["h"] = "close_node",
      ["K"] = "focus_preview",
      ["a"] = { "add", config = { show_path = "relative" } },
    },
  },
  filesystem = {
    window = {
      mappings = { ["<cr>"] = "set_root" },
      fuzzy_finder_mappings = {
        ["<C-j>"] = "move_cursor_down",
        ["<C-k>"] = "move_cursor_up",
      },
    },
    follow_current_file = { enabled = true },
    use_libuv_file_watcher = true,
  },
  buffers = {
    window = { mappings = { ["<cr>"] = "set_root" } },
  },
  event_handlers = {
    {
      event = "neo_tree_buffer_enter",
      handler = function()
        vim.opt.foldenable = false
        vim.opt.foldcolumn = "0"
      end,
    },
  },
}

local keys = {
  {
    "<leader>bs",
    function() require("neo-tree.command").execute { source = "buffers", position = "float", toggle = true } end,
    "Swicth buffer",
  },
  {
    "<leader>ge",
    function() require("neo-tree.command").execute { source = "git_status", position = "float", toggle = true } end,
    "Git explorer",
  },
  { "<leader>e", function() require("neo-tree.command").execute { toggle = true } end, "Explorer" },
  {
    "<leader>lo",
    function() require("neo-tree.command").execute { source = "document_symbols", position = "right", toggle = true } end,
    "Code outline",
  },
}

require("utils").lazy {
  cmds = "Neotree",
  pack = "neo-tree.nvim",
  name = "neo-tree",
  opts = opts,
  keys = keys,
}
