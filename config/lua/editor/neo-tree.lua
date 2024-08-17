---@type LazyPluginSpec
return {
  "nvim-neo-tree/neo-tree.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  cmd = "Neotree",
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true })
      end,
      desc = "Explorer",
    },
  },
  opts = {
    sources = { "filesystem" },
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
        ["l"] = "open",
        ["h"] = "close_node",

        ["S"] = "open_vsplit",
        ["s"] = "open_split",
      },
    },
    filesystem = {
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
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
