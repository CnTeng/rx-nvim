local opts = {
  options = {
    diagnostics = "coc",
    offsets = {
      {
        filetype = "coc-explorer",
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

require("core.utils").lazy_plugin {
  events = "BufEnter",
  callback = function()
    vim.cmd.packadd "bufferline.nvim"
    require("core.utils").load_plugin { name = "bufferline", opts = opts, keys = keys }
  end,
}
