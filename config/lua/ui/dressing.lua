---@type LazyPluginSpec
return {
  "stevearc/dressing.nvim",
  event = "VeryLazy",
  opts = {
    select = {
      fzf_lua = {
        winopts = {
          height = 0.3,
          width = 0.5,
        },
      },

      get_config = function(opts)
        if opts.kind == "codeaction" then
          return {
            backend = { "builtin" },
            builtin = {
              title_pos = "left",
              relative = "cursor",
              min_width = { 20, 0.2 },
              min_height = 3,
            },
          }
        end
      end,
    },
  },
}
