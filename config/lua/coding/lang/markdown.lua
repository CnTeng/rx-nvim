return {
  {
    "iamcco/markdown-preview.nvim",
    cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
  },
  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = { markdown = { "prettier" } },
    },
  },
}
