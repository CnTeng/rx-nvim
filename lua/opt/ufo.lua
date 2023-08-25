local opts = {
  preview = {
    win_config = { border = "none" },
    mappings = {
      scrollU = "<C-u>",
      scrollD = "<C-d>",
      switch = "K",
    },
  },
}

local keys = {
  { "zR", function() require("ufo").openAllFolds() end, "Open all folds" },
  { "zM", function() require("ufo").closeAllFolds() end, "Close all folds" },
  {
    "K",
    function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then vim.lsp.buf.hover() end
    end,
    "Hover",
  },
}

require("utils.plugin").lazy {
  events = { "VimEnter" },
  pname = "nvim-ufo",
  name = "ufo",
  opts = opts,
  keys = keys,
}
