local opt = vim.opt

opt.breakindent = true
if not vim.env.SSH_TTY then
  opt.clipboard = "unnamedplus"
end
opt.colorcolumn = "80"
opt.completeopt = { "menu", "menuone", "noinsert" }
opt.confirm = true
opt.cursorline = true
opt.expandtab = true
opt.fileencodings = { "ucs-bom", "utf-8", "gbk", "default", "latin1" }
opt.fillchars = {
  eob = " ",
  foldopen = "",
  foldclose = "",
  foldsep = " ",
}
opt.foldcolumn = "1"
opt.foldlevel = 99
opt.foldlevelstart = 99
opt.ignorecase = true
opt.jumpoptions = "stack"
opt.linebreak = true
opt.mouse = ""
opt.number = true
opt.numberwidth = 2
opt.pumheight = 10
opt.relativenumber = true
opt.scrolloff = 8
opt.shiftwidth = 0
opt.shortmess:append("I")
opt.showmode = false
opt.showtabline = 2
opt.sidescrolloff = 5
opt.signcolumn = "yes"
opt.smartcase = true
opt.smartindent = true
opt.smoothscroll = true
opt.splitbelow = true
opt.splitright = true
opt.swapfile = false
opt.tabstop = 2
opt.termguicolors = true
opt.title = true
opt.undofile = true
opt.updatetime = 300
opt.virtualedit = "block"
opt.wrap = false
