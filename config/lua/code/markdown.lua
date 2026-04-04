---@module "lz.n"
---@type lz.n.Spec
return {
  {
    "render-markdown.nvim",
    ft = "markdown",
    beforeAll = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(args)
          vim.keymap.set("n", "<leader>cr", function()
            require("render-markdown").toggle()
          end, { buffer = args.buf, desc = "Toggle markdown render" })
        end,
      })
    end,
    before = function()
      require("lz.n").trigger_load("nvim-web-devicons")
    end,
    after = function()
      require("render-markdown").setup({
        enabled = false,
        heading = {
          icons = { "󰼏 ", "󰎨 ", "󰼑 ", "󰎲 ", "󰼓 ", "󰎴 " },
        },
        code = {
          position = "right",
          width = "block",
          right_pad = 10,
        },
      })
    end,
  },

  {
    "markdown-preview.nvim",
    ft = "markdown",
    cmd = { "MarkdownPreview", "MarkdownPreviewStop", "MarkdownPreviewToggle" },
    beforeAll = function()
      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(args)
          vim.keymap.set(
            "n",
            "<leader>cp",
            "<cmd>MarkdownPreviewToggle<cr>",
            { buffer = args.buf, desc = "Toggle markdown preview" }
          )
        end,
      })
    end,
  },
}
