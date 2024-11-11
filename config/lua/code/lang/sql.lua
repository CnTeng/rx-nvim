---@type LazyPluginSpec
return {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      sql = { "sql_formatter" },
    },
  },
}
