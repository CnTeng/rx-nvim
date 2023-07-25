local opts = {
  close_if_last_window = true,
  source_selector = {
    winbar = true,
    statusline = false,
    content_layout = "center",
  },
  default_component_configs = {
    indent = { padding = 0 },
  },
  window = {
    width = 30,
    mappings = {
      ["<space>"] = false,
      ["<2-LeftMouse>"] = "open",
      ["<cr>"] = "open",
      ["o"] = "open",
      ["s"] = "open_split",
      ["v"] = "open_vsplit",
      ["t"] = "open_tabnew",
      ["w"] = false,
      ["a"] = { "add", config = { show_path = "relative" } },
      ["H"] = "prev_source",
      ["L"] = "next_source",
    },
  },
  filesystem = {
    follow_current_file = true,
    window = {
      mappings = { ["h"] = "toggle_hidden" },
    },
  },
}
local keys = {
  { "n", "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Explorer" },
}

require("utils.plugin").load_plugin {
  name = "neo-tree",
  opts = opts,
  keys = keys,
}
