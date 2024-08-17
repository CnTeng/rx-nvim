---@type LazyPluginSpec
return {
  "folke/which-key.nvim",
  event = "VeryLazy",
  opts = {
    spec = {
      {
        mode = { "n", "v" },
        { "<localleader>", group = "local" },
        { "<leader><tab>", group = "tabs" },
        { "<leader>a", group = "ai" },
        { "<leader>f", group = "find" },
        { "<leader>g", group = "git" },
        { "<leader>l", group = "code" },
        { "<leader>s", group = "session" },
        { "<leader>t", group = "terminal" },
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
