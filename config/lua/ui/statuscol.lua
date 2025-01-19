---@type LazyPluginSpec
return {
  "luukvbaal/statuscol.nvim",
  opts = function()
    local builtin = require("statuscol.builtin")

    return {
      relculright = true,
      ft_ignore = { "codecompanion" },
      segments = {
        { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
        { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
        { text = { "%s" }, click = "v:lua.ScSa" },
      },
    }
  end,
}
