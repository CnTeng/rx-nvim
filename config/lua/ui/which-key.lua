---@module "lz.n"
---@type lz.n.Spec
return {
  "which-key.nvim",
  event = "DeferredUIEnter",
  after = function()
    require("which-key").setup({
      spec = {
        {
          mode = { "n", "v" },
          { "<leader>a", group = "ai" },
          { "<leader>c", group = "code" },
          { "<leader>d", group = "debug" },
          { "<leader>f", group = "find" },
          { "<leader>g", group = "git" },
          { "<leader>l", group = "lsp" },
          { "<leader>s", group = "session" },
          { "<leader>t", group = "terminal" },
          { "<leader><tab>", group = "tab" },
          { "[", group = "prev" },
          { "]", group = "next" },
          { "g", group = "goto" },
          { "gz", group = "surround" },
        },
      },
      win = { no_overlap = false },
      icons = { rules = false },
    })
  end,
}
