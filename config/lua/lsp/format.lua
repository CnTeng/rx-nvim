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
  end,
  opts = {
    formatters_by_ft = {
      json = { "jq" },
      terraform = { "tofu_fmt" },
      tf = { "tofu_fmt" },
      toml = { "taplo" },
      xml = { "xmllint" },
      yaml = { "prettier" },
      ["_"] = { "trim_whitespace" },
    },
    default_format_opts = {
      lsp_format = "fallback",
    },
    format_on_save = {
      timeout_ms = 500,
    },
  },
}
