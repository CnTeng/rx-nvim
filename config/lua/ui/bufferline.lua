---@type LazyPluginSpec
return {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  keys = {
    { "[b", "<cmd>bprevious<cr>", desc = "Previous buffer" },
    { "]b", "<cmd>bnext<cr>", desc = "Next buffer" },
    { "<S-h>", "<cmd>BufferLineCyclePrev<cr>", desc = "Previous buffer" },
    { "<S-l>", "<cmd>BufferLineCycleNext<cr>", desc = "Next buffer" },
    { "[B", "<cmd>BufferLineMovePrev<cr>", desc = "Move buffer prev" },
    { "]B", "<cmd>BufferLineMoveNext<cr>", desc = "Move buffer next" },
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
