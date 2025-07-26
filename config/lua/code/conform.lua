---@type LazyPluginSpec
return {
  "stevearc/conform.nvim",
  event = "LazyFile",
  keys = {
    {
      mode = { "n", "v" },
      "<leader>lf",
      function()
        require("conform").format()
      end,
      desc = "Format",
    },
  },
  init = function()
    vim.opt.formatexpr = "v:lua.require'conform'.formatexpr()"

    vim.api.nvim_create_user_command("FormatBufToggle", function()
      vim.b.disable_autoformat = not vim.b.disable_autoformat
    end, {
      desc = "Toggle buffer autoformat",
    })

    vim.api.nvim_create_user_command("FormatToggle", function()
      vim.g.disable_autoformat = not vim.g.disable_autoformat
      if not vim.g.disable_autoformat then
        for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
          vim.b[bufnr].disable_autoformat = vim.g.disable_autoformat
        end
      end
    end, {
      desc = "Toggle global autoformat",
    })
  end,
  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      html = { "prettier" },
      lua = { "stylua" },
      markdown = { "prettier" },
      python = { "black" },
      sql = { "sql_formatter" },
      xml = { "xmllint" },
      ["_"] = { "trim_whitespace", lsp_format = "last" },
    },
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { timeout_ms = 500 }
    end,
  },
}
