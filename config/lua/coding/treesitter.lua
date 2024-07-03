return {
  "nvim-treesitter/nvim-treesitter",
  event = "LazyFile",
  init = function()
    vim.opt.rtp:prepend(vim.g.treesitter_path)
  end,
  opts = {
    highlight = {
      enable = true,
      disable = { "c", "cpp" },
      additional_vim_regex_highlighting = { "markdown" },
    },
    incremental_selection = { enable = true },
    indent = { enable = true },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
