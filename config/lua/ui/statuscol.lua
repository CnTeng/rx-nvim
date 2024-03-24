return {
  "luukvbaal/statuscol.nvim",
  event = "LazyFile",
  init = function()
    vim.opt.foldenable = true
    vim.opt.foldcolumn = "1"
    vim.opt.foldlevel = 99
    vim.opt.foldlevelstart = 99
    vim.o.fillchars = [[eob: ,fold: ,foldopen:,foldsep: ,foldclose:]]
  end,
  opts = function()
    local builtin = require "statuscol.builtin"

    return {
      relculright = true,
      segments = {
        { text = { builtin.foldfunc, " " }, condition = { true, builtin.not_empty }, click = "v:lua.ScFa" },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        { text = { "%s" }, click = "v:lua.ScSa" },
      },
    }
  end,
}
