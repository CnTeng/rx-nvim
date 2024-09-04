return {
  ---@type LazyPluginSpec
  {
    "jellydn/hurl.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      "nvim-lua/plenary.nvim",
      "nvim-treesitter/nvim-treesitter",
    },
    ft = "hurl",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "hurl",
        callback = function(args)
          local bufnr = args.buf
          local keymap = vim.keymap.set
          keymap("n", "<leader>cR", "<cmd>HurlRunner<cr>", { buffer = bufnr, desc = "Run all requests" })
          keymap("n", "<leader>cr", "<cmd>HurlRunnerAt<cr>", { buffer = bufnr, desc = "Run request" })
          keymap("n", "<leader>ce", "<cmd>HurlRunnerToEntry<cr>", { buffer = bufnr, desc = "Run request to entry" })
          keymap("n", "<leader>cm", "<cmd>HurlToggleMode<cr>", { buffer = bufnr, desc = "Toggle mode" })
          keymap("v", "<leader>cr", ":HurlRunner<cr>", { buffer = bufnr, desc = "Run requests" })
        end,
      })
    end,
    opts = { auto_close = false },
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        hurl = { "hurlfmt" },
      },
      formatters = {
        hurlfmt = {
          command = "hurlfmt",
          args = { "--no-color" },
        },
      },
    },
  },
}
