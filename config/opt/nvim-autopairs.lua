local opts = {
  map_cr = false,
  disable_filetype = { "TelescopePrompt" },
  fast_wrap = {
    map = "<M-e>",
    chars = { "{", "[", "(", '"', "'" },
    pattern = string.gsub([[ [%'%"%)%>%]%)%}%,] ]], "%s+", ""),
    offset = 0,
    end_key = "$",
    keys = "qwertyuiopzxcvbnmasdfghjkl",
    check_comma = true,
    highlight = "PmenuSel",
    highlight_grey = "LineNr",
  },
}

local keys = {
  {
    "i",
    "<cr>",
    function()
      return vim.fn["coc#pum#visible"]() == 1 and vim.fn["coc#pum#confirm"]()
        or require("nvim-autopairs").autopairs_cr()
    end,
    { expr = true, desc = "Confirm selection" },
  },
}

require("core.utils").lazy_plugin {
  events = { "BufReadPre", "BufNewFile" },
  callback = function()
    vim.cmd.packadd "nvim-autopairs"
    require("core.utils").load_plugin { name = "nvim-autopairs", opts = opts, keys = keys }
  end,
}
