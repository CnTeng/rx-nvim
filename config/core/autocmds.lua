local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

autocmd("FileType", {
  desc = "Unlist quickfist buffers",
  group = augroup("unlist_quickfist", { clear = true }),
  pattern = { "qf", "help", "man", "notify", "lspinfo" },
  callback = function() vim.opt_local.buflisted = false end,
})

autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = augroup("highlightyank", { clear = true }),
  pattern = "*",
  callback = function() vim.highlight.on_yank() end,
})

local restore_im = augroup("fcitx5", { clear = true })

autocmd({ "VimEnter", "FocusGained", "InsertLeave", "CmdlineLeave" }, {
  desc = "restore default im",
  group = restore_im,
  callback = function()
    local current_im = tonumber(vim.fn.system "fcitx5-remote")
    vim.g.previous_im = current_im
    if current_im ~= 1 then vim.fn.system "fcitx5-remote -c" end
  end,
})

autocmd("InsertEnter", {
  desc = "restore previous im",
  group = restore_im,
  callback = function()
    local current_im = tonumber(vim.fn.system "fcitx5-remote")
    if current_im ~= vim.g.previous_im then vim.fn.system "fcitx5-remote -o" end
  end,
})
