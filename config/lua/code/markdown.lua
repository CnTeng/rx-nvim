---@type LazyPluginSpec[]
return {
  {
    "MeanderingProgrammer/render-markdown.nvim",
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    ft = { "markdown" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(args)
          vim.keymap.set("n", "<leader>cr", function()
            require("render-markdown").toggle()
          end, { buffer = args.buf, desc = "Toggle markdown render" })
        end,
      })
    end,
    opts = {
      heading = {
        icons = { "󰼏 ", "󰎨 ", "󰼑 ", "󰎲 ", "󰼓 ", "󰎴 " },
      },
      code = {
        position = "right",
        width = "block",
        right_pad = 10,
      },
    },
  },

  {
    "iamcco/markdown-preview.nvim",
    ft = { "markdown" },
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(args)
          vim.keymap.set(
            "n",
            "<leader>cp",
            "<cmd>MarkdownPreviewToggle<cr>",
            { buffer = args.buf, desc = "Toggle markdown preview" }
          )
        end,
      })
    end,
  },
}
