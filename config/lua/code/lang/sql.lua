---@type LazyPluginSpec
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      sql = { "sql_formatter" },
    },
  },
  config = function(_, opts)
    require("conform.formatters.sql_formatter").args = function(_, ctx)
      local config_file = vim.fs.find(".sql-formatter.json", { upward = true, path = ctx.dirname })[1]
      if config_file then
        return { "-c", config_file }
      end

      return { "-l", "postgresql" }
    end

    require("conform").setup(opts)
  end,
}
