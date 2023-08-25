vim.opt.foldenable = true
vim.opt.foldcolumn = "1"
vim.opt.foldlevel = 99
vim.opt.foldlevelstart = 99
vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]

local builtin = require "statuscol.builtin"

local opts = {
  relculright = true,
  segments = {
    { text = { builtin.foldfunc, " " }, condition = { true, builtin.not_empty }, click = "v:lua.ScFa" },
    { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
    { text = { "%s" }, click = "v:lua.ScSa" },
  },
}

require("utils.plugin").load {
  name = "statuscol",
  opts = opts,
}
