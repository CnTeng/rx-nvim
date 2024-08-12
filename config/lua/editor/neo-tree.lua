---@type LazyPluginSpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  cmd = "Neotree",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  keys = {
    {
      "<leader>ge",
      function()
        require("neo-tree.command").execute({ source = "git_status", position = "float", toggle = true })
      end,
      desc = "Git explorer",
    },
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "Explorer",
    },
  },
  opts = {
    sources = { "filesystem", "git_status" },
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
      window = { mappings = { ["<cr>"] = "set_root" } },
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
  },
}
