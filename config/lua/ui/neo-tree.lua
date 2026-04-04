---@module "lz.n"
---@type lz.n.Spec
return {
  "neo-tree.nvim",
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
  before = function()
    require("lz.n").trigger_load("nvim-web-devicons")
  end,
  after = function()
    local function on_move(data)
      Snacks.rename.on_rename_file(data.source, data.destination)
    end

    require("neo-tree").setup({
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
          l = "open",
          h = "close_node",
          S = "open_vsplit",
          s = "open_split",
        },
      },
      filesystem = {
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      event_handlers = {
        {
          event = "neo_tree_popup_input_ready",
          handler = function(args)
            vim.keymap.set("i", "<Esc>", vim.cmd.stopinsert, { noremap = true, buffer = args.bufnr })
          end,
        },
        { event = "file_moved", handler = on_move },
        { event = "file_renamed", handler = on_move },
      },
    })
  end,
}
