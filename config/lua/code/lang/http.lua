vim.filetype.add({
  extension = { ["http"] = "http" },
})

---@type LazyPluginSpec[]
return {
  {
    "mistweaverco/kulala.nvim",
    ft = "http",
    init = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "http",
        callback = function(args)
          local bufnr = args.buf
          local keymap = vim.keymap.set
          keymap("n", "<leader>cr", require("kulala").run, { buffer = bufnr, desc = "Send request" })
          keymap("n", "<leader>ct", require("kulala").toggle_view, { buffer = bufnr, desc = "Toggle view" })
          keymap("n", "[r", require("kulala").jump_prev, { buffer = bufnr, desc = "Previous request" })
          keymap("n", "]r", require("kulala").jump_next, { buffer = bufnr, desc = "Next request" })
        end,
      })
    end,
    opts = {},
  },

  {
    "stevearc/conform.nvim",
    opts = {
      formatters_by_ft = {
        http = { "kulala-fmt" },
      },
    },
  },
}
