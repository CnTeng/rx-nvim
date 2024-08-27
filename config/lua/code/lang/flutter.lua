---@type LazyPluginSpec
return {
  "akinsho/flutter-tools.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim",
  },
  ft = "dart",
  opts = {
    lsp = {
      color = { enabled = true },
      on_attach = function(_, bufnr)
        vim.keymap.set("n", "<leader>cd", "<cmd>FlutterDevices<cr>", { buffer = bufnr, desc = "Devices" })
        vim.keymap.set("n", "<leader>ce", "<cmd>FlutterEmulators<cr>", { buffer = bufnr, desc = "Emulators" })
        vim.keymap.set("n", "<leader>co", "<cmd>FlutterOutlineOpen<cr>", { buffer = bufnr, desc = "Outline" })
        vim.keymap.set("n", "<leader>cq", "<cmd>FlutterQuit<cr>", { buffer = bufnr, desc = "Quit" })
        vim.keymap.set("n", "<leader>cr", "<cmd>FlutterRun<cr>", { buffer = bufnr, desc = "Run" })
        vim.keymap.set("n", "<leader>cR", "<cmd>FlutterRestart<cr>", { buffer = bufnr, desc = "Restart" })
      end,
    },
  },
}
