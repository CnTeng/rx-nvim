return {
  ---@type LazyPluginSpec
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    ft = { "markdown" },
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(args)
          vim.keymap.set(
            "n",
            "<localleader>p",
            "<cmd>MarkdownPreviewToggle<cr>",
            { buffer = args.buf, desc = "Toggle markdown preview" }
          )
        end,
      })
    end,
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { markdown = { "prettier" } },
    },
  },
}
