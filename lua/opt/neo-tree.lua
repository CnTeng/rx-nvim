local opts = {
  sources = { "filesystem", "buffers", "git_status", "document_symbols" },
  close_if_last_window = true,
  source_selector = {
    winbar = true,
    content_layout = "center",
  },
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
      ["H"] = "prev_source",
      ["L"] = "next_source",
    },
  },
  filesystem = {
    window = {
      mappings = { ["<cr>"] = "set_root", ["."] = "toggle_hidden" },
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
  { "<leader>e", "<cmd>Neotree toggle left<cr>", "Explorer" },
  { "<leader>lo", "<cmd>Neotree toggle document_symbols right<cr>", "Code outline" },
}

require("utils.plugin").lazy {
  cmd = "Neotree",
  pname = "neo-tree.nvim",
  name = "neo-tree",
  opts = opts,
  keys = keys,
}
