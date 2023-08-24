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
  { "n", "[b", "<cmd>bprevious<cr>", { desc = "Previous buffer" } },
  { "n", "]b", "<cmd>bnext<cr>", { desc = "Next buffer" } },
  { "n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" } },
  { "n", "<S-h>", "<cmd>BufferLineCyclePrev<cr>", { desc = "Previous buffer" } },
  { "n", "<S-l>", "<cmd>BufferLineCycleNext<cr>", { desc = "Next buffer" } },
  { "n", "<leader>bC", "<cmd>bdelete<cr>", { desc = "Close buffer (without layout)" } },
  { "n", "<leader>bh", "<cmd>BufferLineMovePrev<cr>", { silent = true, desc = "Move buffer Left" } },
  { "n", "<leader>bl", "<cmd>BufferLineMoveNext<cr>", { silent = true, desc = "Move buffer Right" } },
}

require("utils.plugin").lazy {
  events = "BufEnter",
  pname = "bufferline.nvim",
  name = "bufferline",
  opts = opts,
  keys = keys,
}
