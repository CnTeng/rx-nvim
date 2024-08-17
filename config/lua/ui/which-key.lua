---@type LazyPluginSpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      {
        mode = { "n", "v" },
        { "<leader>a", group = "ai" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>l", group = "lsp" },
        { "<leader>s", group = "session" },
        { "<leader>t", group = "terminal" },
        { "<leader><tab>", group = "tab" },
        { "<localleader>", group = "local" },
        { "[", group = "prev" },
        { "]", group = "next" },
        { "g", group = "goto" },
        { "gz", group = "surround" },
      },
    },
    win = { no_overlap = false },
    icons = { rules = false },
  },
}
