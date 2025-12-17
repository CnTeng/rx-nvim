local keymap = vim.keymap.set

vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Standed operations
keymap("n", "<ESC>", "<cmd>noh<cr>", { noremap = true, desc = "No highlight" })
keymap("n", "<C-s>", "<cmd>w<cr>", { desc = "Write" })
keymap("n", "<C-q>", "<cmd>q<cr>", { desc = "Quit" })
keymap("n", "<leader>q", "<cmd>qa<cr>", { desc = "Quit all" })

-- Tabs
keymap("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })
keymap("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
keymap("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
keymap("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
keymap("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
keymap("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
keymap("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "Close Tab" })

-- Cmdline
keymap("c", "<C-p>", "<Up>")
keymap("c", "<C-n>", "<Down>")
keymap("c", "<C-a>", "<Home>")

-- Clipboard
keymap({ "n", "x" }, "<leader>y", '"+y', { desc = "Yank to clipboard" })
keymap({ "n", "x" }, "<leader>p", '"+p', { desc = "Paste from clipboard" })
