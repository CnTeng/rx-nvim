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
  { "n", "zR", function() require("ufo").openAllFolds() end, { desc = "Open all folds" } },
  { "n", "zM", function() require("ufo").closeAllFolds() end, { desc = "Close all folds" } },
  {
    "n",
    "K",
    function()
      local winid = require("ufo").peekFoldedLinesUnderCursor()
      if not winid then vim.lsp.buf.hover() end
    end,
    { desc = "Hover" },
  },
}

require("utils.plugin").lazy {
  events = { "VimEnter" },
  pname = "nvim-ufo",
  name = "ufo",
  opts = opts,
  keys = keys,
}
