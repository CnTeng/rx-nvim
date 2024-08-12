return {
  ---@type LazyPluginSpec
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
    ft = { "markdown" },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { markdown = { "prettier" } },
    },
  },
}
