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
  },
  config = function(_, opts)
    local events = require("neo-tree.events")
    local function on_move(data)
      Snacks.rename.on_rename_file(data.source, data.destination)
    end

    opts.event_handlers = opts.event_handlers or {}
    vim.list_extend(opts.event_handlers, {
      {
        event = events.NEO_TREE_POPUP_INPUT_READY,
        handler = function(args)
          vim.keymap.set("i", "<Esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
        end,
      },
      { event = events.FILE_MOVED, handler = on_move },
      { event = events.FILE_RENAMED, handler = on_move },
    })

    require("neo-tree").setup(opts)
  end,
}
