return {
  "nvim-lualine/lualine.nvim",
  event = "BufEnter",
  opts = {
    options = {
      theme = "bamboo",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      globalstatus = true,
    },
    sections = {
      lualine_a = {
        {
          "mode",
          fmt = function(str)
            return vim.fn.winwidth(0) > 80 and " " .. str .. " " or " "
          end,
          padding = 0,
        },
      },
      lualine_b = {
        { "branch", icon = "" },
        { "diff", colored = false, symbols = { added = " ", modified = " ", removed = " " } },
      },
      lualine_c = {
        { "diagnostics", sources = { "nvim_diagnostic" } },
      },
      lualine_x = {
        { "filetype", icon_only = true },
        "encoding",
      },
      lualine_y = {
        { "location", separator = " ", padding = { left = 1, right = 0 } },
        { "progress", padding = { left = 0, right = 1 } },
      },
      lualine_z = {
        {
          function()
            return vim.fn.winwidth(0) > 80 and "  " .. os.date("%R ") or " "
          end,
          padding = 0,
        },
      },
    },
    extensions = { "neo-tree", "lazy" },
  },
}
