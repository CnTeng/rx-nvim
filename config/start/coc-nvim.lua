local fn = vim.fn

-- Autocomplete
function _G.check_back_space()
  local col = fn.col "." - 1
  return col == 0 or fn.getline("."):sub(col, col):match "%s" ~= nil
end

local opts = { noremap = true, expr = true }
local keys = {
  -- coc-completion
  { "i", "<C-k>", function() return fn["coc#pum#visible"]() == 1 and fn["coc#pum#prev"](1) or "<C-k>" end, opts },
  { "i", "<C-j>", function() return fn["coc#pum#visible"]() == 1 and fn["coc#pum#next"](1) or "<C-j>" end, opts },
  { "i", "<up>", function() return fn["coc#pum#visible"]() == 1 and fn["coc#pum#prev"](1) or "<up>" end, opts },
  { "i", "<down>", function() return fn["coc#pum#visible"]() == 1 and fn["coc#pum#next"](1) or "<down>" end, opts },
  { "i", "<C-e>", function() return fn["coc#pum#visible"]() == 1 and fn["coc#pum#cancel"]() or "<C-e>" end, opts },
  { "i", "<c-s>", function() return fn["coc#refresh"]() end, { silent = true, expr = true } },
  {
    "i",
    "<TAB>",
    function()
      if fn["coc#pum#visible"]() == 1 then
        return fn["coc#pum#next"](1)
      elseif fn["coc#expandableOrJumpable"]() then
        return "<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])<CR>"
      elseif check_back_space() then
        return "<TAB>"
      else
        return fn["coc#refresh"]()
      end
    end,
    opts,
  },
  { "i", "<S-TAB>", function() return fn["coc#pum#visible"]() == 1 and fn["coc#pum#prev"](1) or "<S-TAB>" end, opts },

  -- coc-diagnostics
  { "n", "]d", "<Plug>(coc-diagnostic-next)", { silent = true, desc = "Next diagnostic" } },
  { "n", "[d", "<Plug>(coc-diagnostic-prev)", { silent = true, desc = "Previous diagnostic" } },
  { "n", "]e", "<Plug>(coc-diagnostic-next-error)", { silent = true, desc = "Next error" } },
  { "n", "[e", "<Plug>(coc-diagnostic-prev-error)", { silent = true, desc = "Previous error" } },
  { "n", "<leader>lq", "<cmd>CocList diagnostics<cr>", { silent = true, desc = "List diagnostic" } },

  -- coc-location
  { "n", "gd", "<Plug>(coc-definition)", { desc = "Go to definition", silent = true } },
  { "n", "gD", "<Plug>(coc-declaration)", { desc = "Go to declaration", silent = true } },
  { "n", "gi", "<Plug>(coc-implementation)", { desc = "Go to implementation", silent = true } },
  { "n", "gt", "<Plug>(coc-type-definition)", { desc = "Go to type definition", silent = true } },
  { "n", "grr", "<Plug>(coc-references)", { desc = "Go to references", silent = true } },
  { "n", "gru", "<Plug>(coc-references-used)", { desc = "Go to references without declarations", silent = true } },

  -- coc-rename
  { "n", "<leader>lr", "<Plug>(coc-rename)", { desc = "Rename current symbol", silent = true } },
  { "n", "<leader>lR", function() fn.CocActionAsync "refactor" end, { desc = "Open refactor buffer", silent = true } },

  -- coc-format
  { "n", "<leader>lf", "<Plug>(coc-format)", { desc = "Format code", silent = true } },
  { "v", "<leader>lf", "<Plug>(coc-format-selected)", { desc = "Format code", silent = true } },

  -- coc-code-actions
  { "n", "<leader>la", "<Plug>(coc-codeaction-cursor)", { desc = "Code action", silent = true } },
  { "v", "<leader>la", "<Plug>(coc-codeaction-selected)", { desc = "Code action", silent = true } },

  -- coc-document-links
  { "n", "go", "<Plug>(coc-openlink)", { desc = "Open document link", silent = true } },

  -- coc-outline
  {
    "n",
    "<leader>lo",
    function()
      local winid = fn["coc#window#find"]("cocViewId", "OUTLINE")
      if winid == -1 then
        fn.CocActionAsync("showOutline", 1)
      else
        fn["coc#window#close"](winid)
      end
    end,
    { desc = "Code outline", silent = true },
  },

  -- coc-selection-range
  { "n", "<leader>ls", "<Plug>(coc-range-select)", { desc = "Range select", silent = true } },
  { "v", "<leader>ls", "<Plug>(coc-range-select)", { desc = "Range select", silent = true } },

  -- coc-code-lens
  { "n", "<leader>ll", "<Plug>(coc-codelens-action)", { desc = "Code lens", silent = true } },

  { "x", "if", "<Plug>(coc-funcobj-i)", { silent = true, nowait = true } },
  { "o", "if", "<Plug>(coc-funcobj-i)", { silent = true, nowait = true } },
  { "x", "af", "<Plug>(coc-funcobj-a)", { silent = true, nowait = true } },
  { "o", "af", "<Plug>(coc-funcobj-a)", { silent = true, nowait = true } },
  { "x", "ic", "<Plug>(coc-classobj-i)", { silent = true, nowait = true } },
  { "o", "ic", "<Plug>(coc-classobj-i)", { silent = true, nowait = true } },
  { "x", "ac", "<Plug>(coc-classobj-a)", { silent = true, nowait = true } },
  { "o", "ac", "<Plug>(coc-classobj-a)", { silent = true, nowait = true } },

  {
    "n",
    "<C-u>",
    function() return fn["coc#float#has_scroll"]() == 1 and fn["coc#float#scroll"](0) or "<C-u>" end,
    { expr = true, silent = true },
  },
  {
    "n",
    "<C-d>",
    function() return fn["coc#float#has_scroll"]() == 1 and fn["coc#float#scroll"](1) or "<C-d>" end,
    { expr = true, silent = true },
  },
  {
    "i",
    "<C-u>",
    function() return fn["coc#float#has_scroll"]() == 1 and "<c-r>=coc#float#scroll(0)<cr>" or "<C-u>" end,
    { expr = true, silent = true },
  },
  {
    "i",
    "<C-d>",
    function() return fn["coc#float#has_scroll"]() == 1 and "<c-r>=coc#float#scroll(1)<cr>" or "<C-d>" end,
    { expr = true, silent = true },
  },
  {
    "v",
    "<C-u>",
    function() return fn["coc#float#has_scroll"]() == 1 and fn["coc#float#scroll"](0) or "<C-u>" end,
    { expr = true, silent = true },
  },
  {
    "v",
    "<C-d>",
    function() return fn["coc#float#has_scroll"]() == 1 and fn["coc#float#scroll"](1) or "<C-d>" end,
    { expr = true, silent = true },
  },
}

require("core.utils").load_plugin { keys = keys }

local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- Highlight the symbol and its references on a CursorHold event(cursor is idle)
augroup("CocGroup", {})

autocmd("CursorHold", {
  group = "CocGroup",
  command = "silent call CocActionAsync('highlight')",
  desc = "Highlight symbol under cursor on CursorHold",
})

-- Setup formatexpr specified filetype(s)
autocmd("FileType", {
  group = "CocGroup",
  pattern = "typescript,json",
  command = "setl formatexpr=CocAction('formatSelected')",
  desc = "Setup formatexpr specified filetype(s).",
})

-- Update signature help on jump placeholder
autocmd("User", {
  group = "CocGroup",
  pattern = "CocJumpPlaceholder",
  command = "call CocActionAsync('showSignatureHelp')",
  desc = "Update signature help on jump placeholder",
})
