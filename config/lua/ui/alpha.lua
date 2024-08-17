---@type LazyPluginSpec
return {
  "goolord/alpha-nvim",
  event = "VimEnter",
  dependencies = "nvim-tree/nvim-web-devicons",
  opts = function()
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                          ]],
      [[  ██████  ██   ██       ███    ██ ██    ██ ██ ███    ███  ]],
      [[  ██   ██  ██ ██        ████   ██ ██    ██ ██ ████  ████  ]],
      [[  ██████    ███   █████ ██ ██  ██ ██    ██ ██ ██ ████ ██  ]],
      [[  ██   ██  ██ ██        ██  ██ ██  ██  ██  ██ ██  ██  ██  ]],
      [[  ██   ██ ██   ██       ██   ████   ████   ██ ██      ██  ]],
      [[                                                          ]],
    }
    dashboard.section.buttons.val = {
      dashboard.button("e", "  > New file", "<cmd>ene<cr>"),
      dashboard.button("LDR f f", "  > Find file", "<cmd>FzfLua files<cr>"),
      dashboard.button("LDR f w", "  > Find text", "<cmd>FzfLua live_grep_native<cr>"),
      dashboard.button("LDR f r", "  > Recent file", "<cmd>FzfLua oldfiles<cr>"),
      dashboard.button("LDR s s", "  > Load session", "<cmd>SessionManager load_session<cr>"),
      dashboard.button("LDR q", "  > Quit all", "<cmd>qa<CR>"),
    }
    dashboard.section.footer.val = "Just For Fun!"

    dashboard.config.layout = {
      { type = "padding", val = vim.fn.floor(vim.fn.winheight(0) * 0.15) },
      dashboard.section.header,
      { type = "padding", val = 2 },
      dashboard.section.buttons,
      dashboard.section.footer,
    }

    return dashboard
  end,

  config = function(_, dashboard)
    require("alpha").setup(dashboard.opts)
  end,
}
