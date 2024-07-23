return {
  "kevinhwang91/nvim-ufo",
  event = "LazyFile",
  dependencies = {
    "kevinhwang91/promise-async",
  },
  keys = function()
    local ufo = require("ufo")

    return {
      { "zR", ufo.openAllFolds, desc = "Open all folds" },
      { "zM", ufo.closeAllFolds, desc = "Close all folds" },
      {
        "K",
        function()
          if not ufo.peekFoldedLinesUnderCursor() then
            vim.lsp.buf.hover()
          end
        end,
        desc = "Hover",
      },
    }
  end,
  opts = function()
    local handler = function(virtText, lnum, endLnum, width, truncate)
      local newVirtText = {}
      local suffix = (" 󰁂 %d "):format(endLnum - lnum)
      local sufWidth = vim.fn.strdisplaywidth(suffix)
      local targetWidth = width - sufWidth
      local curWidth = 0
      for _, chunk in ipairs(virtText) do
        local chunkText = chunk[1]
        local chunkWidth = vim.fn.strdisplaywidth(chunkText)
        if targetWidth > curWidth + chunkWidth then
          table.insert(newVirtText, chunk)
        else
          chunkText = truncate(chunkText, targetWidth - curWidth)
          local hlGroup = chunk[2]
          table.insert(newVirtText, { chunkText, hlGroup })
          chunkWidth = vim.fn.strdisplaywidth(chunkText)
          if curWidth + chunkWidth < targetWidth then
            suffix = suffix .. (" "):rep(targetWidth - curWidth - chunkWidth)
          end
          break
        end
        curWidth = curWidth + chunkWidth
      end
      table.insert(newVirtText, { suffix, "MoreMsg" })
      return newVirtText
    end

    return {
      fold_virt_text_handler = handler,
      preview = {
        win_config = {
          border = "none",
        },
        mappings = {
          scrollU = "<C-u>",
          scrollD = "<C-d>",
          switch = "K",
        },
      },
    }
  end,
}
