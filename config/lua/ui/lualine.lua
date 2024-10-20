---@type LazyPluginSpec
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
          icon = vim.bo.modified and "" or "",
        },
      },
      lualine_b = {
        { "branch", icon = "" },
        { "diff", colored = false, symbols = { added = " ", modified = " ", removed = " " } },
      },
      lualine_c = { "diagnostics" },
      lualine_x = {
        "copilot",
        { "filetype", icon_only = true },
        "encoding",
      },
      lualine_y = {
        { "progress", icon = "" },
      },
      lualine_z = {
        { "location", icon = "" },
      },
    },
    extensions = { "fzf", "lazy", "man", "neo-tree", "quickfix", "toggleterm" },
  },
}
