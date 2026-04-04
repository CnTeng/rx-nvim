---@module "lz.n"
---@type lz.n.Spec
return {
  "lualine.nvim",
  event = "BufEnter",
  after = function()
    require("lualine").setup({
      options = {
        theme = "bamboo",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
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
          {
            function()
              return " "
            end,
            color = function()
              if vim.g.disable_autoformat or vim.b.disable_autoformat then
                return "lualine_c_diagnostics_error_normal"
              else
                return "lualine_c_normal"
              end
            end,
          },
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
      extensions = { "fzf", "man", "neo-tree", "quickfix", "toggleterm" },
    })
  end,
}
