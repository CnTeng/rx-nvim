local opts = {
  options = {
    diagnostics = "nvim_lsp",
    offsets = {
      {
        filetype = "neo-tree",
        text = "File Explorer",
        text_align = "center",
        separator = true,
      },
    },
    enforce_regular_tabs = true,
    always_show_bufferline = false,
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get {
    styles = { "bold" },
  },
}

local keys = {
  { "[b", "<cmd>bprevious<cr>", "Previous buffer" },
  { "]b", "<cmd>bnext<cr>", "Next buffer" },
  { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", "Previous buffer" },
  { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", "Previous buffer" },
  { "<S-l>", "<cmd>BufferLineCycleNext<cr>", "Next buffer" },
  { "<leader>bC", "<cmd>bdelete<cr>", "Close buffer (without layout)" },
  { "<leader>bh", "<cmd>BufferLineMovePrev<cr>", { silent = true, desc = "Move buffer Left" } },
  { "<leader>bl", "<cmd>BufferLineMoveNext<cr>", { silent = true, desc = "Move buffer Right" } },
}

require("utils.plugin").lazy {
  pname = "bufferline.nvim",
  event = "BufEnter",
  name = "bufferline",
  opts = opts,
  keys = keys,
}
