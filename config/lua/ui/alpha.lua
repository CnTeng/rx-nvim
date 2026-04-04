---@module "lz.n"
---@type lz.n.Spec
return {
  "alpha-nvim",
  event = "VimEnter",
  after = function()
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[             ]],
      [[ ┃   ╲   ┃ ┃ ]],
      [[ ┃ ┃╲ ╲  ┃ ┃ ]],
      [[ ┃ ┃ ╲ ╲ ┃ ┃ ]],
      [[ ┃ ┃  ╲ ╲┃ ┃ ]],
      [[ ┃ ┃   ╲   ┃ ]],
      [[             ]],
    }

    dashboard.section.buttons.val = {
      dashboard.button("LDR f f", "  > Find file", "<cmd>FzfLua files<cr>"),
      dashboard.button("LDR f w", "  > Find text", "<cmd>FzfLua live_grep_native<cr>"),
      dashboard.button("LDR f r", "  > Recent file", "<cmd>FzfLua oldfiles<cr>"),
      dashboard.button("LDR s r", "  > Recent session", "<cmd>AutoSession search<cr>"),
      dashboard.button("LDR q", "  > Quit all", "<cmd>qa<cr>"),
    }

    dashboard.section.footer.val = "Just For Fun!"

    dashboard.config.layout = {
      {
        type = "padding",
        val = function()
          local header = #dashboard.section.header.val
          local buttons = #dashboard.section.buttons.val * 2
          local content = header + 1 + buttons + 1
          return math.max(0, math.floor((vim.fn.winheight(0) - content) / 2))
        end,
      },
      dashboard.section.header,
      { type = "padding", val = 1 },
      dashboard.section.buttons,
      dashboard.section.footer,
    }

    require("alpha").setup(dashboard.opts)
  end,
}
