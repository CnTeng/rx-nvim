local dashboard = require "alpha.themes.dashboard"
dashboard.opts.layout[1].val = 6

dashboard.section.header.val = {
  "                                                          ",
  "  ██████  ██   ██       ███    ██ ██    ██ ██ ███    ███  ",
  "  ██   ██  ██ ██        ████   ██ ██    ██ ██ ████  ████  ",
  "  ██████    ███   █████ ██ ██  ██ ██    ██ ██ ██ ████ ██  ",
  "  ██   ██  ██ ██        ██  ██ ██  ██  ██  ██ ██  ██  ██  ",
  "  ██   ██ ██   ██       ██   ████   ████   ██ ██      ██  ",
  "                                                          ",
}

dashboard.section.buttons.val = {
  dashboard.button("LDR f f", "  > Find files", ":Telescope find_files <CR>"),
  dashboard.button("LDR f l", "  > New file", ":ene <BAR> startinsert <CR>"),
  dashboard.button("LDR f r", "  > Recent file", ":Telescope oldfiles <CR>"),
  dashboard.button("LDR s w", "  > Search text", ":Telescope live_grep <CR>"),
  dashboard.button("LDR q", "  > Quit Neovim", ":qa<CR>"),
}

for _, button in ipairs(dashboard.section.buttons.val) do
  button.opts.hl = "keyword"
  button.opts.hl_shortcut = "AlphaShortcut"
end
dashboard.section.header.opts.hl = "AlphaHeader"
dashboard.section.footer.opts.hl = "AlphaFooter"

local keys = { { "<leader>a", "<cmd>Alpha<cr>", "Alpha" } }

require("utils").lazy {
  name = "alpha",
  lazy = false,
  opts = dashboard.opts,
  keys = keys,
}
