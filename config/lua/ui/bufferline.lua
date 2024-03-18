return {
  "akinsho/bufferline.nvim",
  event = "BufEnter",
  keys = {
    { "[b", "<cmd>bprevious<cr>", desc = "Previous buffer" },
    { "]b", "<cmd>bnext<cr>", desc = "Next buffer" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "<leader>c", "<cmd>bdelete<cr>", desc = "Close buffer" },
  },
  opts = {
    options = {
      mode = "tabs",
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
      sort_by = "tabs",
    },
  },
}
