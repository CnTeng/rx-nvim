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
      if not winid then
        local cw = vim.fn.expand "<cword>"
        if vim.fn.index({ "vim", "help" }, vim.bo.filetype) >= 0 then
          vim.api.nvim_command("h " .. cw)
        elseif vim.api.nvim_eval "coc#rpc#ready()" then
          vim.fn.CocActionAsync "doHover"
        else
          vim.api.nvim_command("!" .. vim.o.keywordprg .. " " .. cw)
        end
      end
    end,
    { desc = "Hover" },
  },
}

require("core.utils").lazy_plugin {
  events = { "BufReadPre", "BufNewFile" },
  callback = function()
    vim.cmd.packadd "nvim-ufo"
    require("core.utils").load_plugin { name = "ufo", opts = opts, keys = keys }
  end,
}
