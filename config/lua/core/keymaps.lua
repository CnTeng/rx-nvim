local keymap = vim.keymap.set

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Standed operations
keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Write" })
keymap("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
keymap("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No highlight" })
keymap("n", "<leader>fn", "<cmd>ene <bar> startinsert <cr>", { desc = "New file" })

-- tabs
keymap("n", "<leader><tab>l", "<cmd>tablast<cr>", { desc = "Last Tab" })
keymap("n", "<leader><tab>o", "<cmd>tabonly<cr>", { desc = "Close Other Tabs" })
keymap("n", "<leader><tab>f", "<cmd>tabfirst<cr>", { desc = "First Tab" })
keymap("n", "<leader><tab>n", "<cmd>tabnew<cr>", { desc = "New Tab" })
keymap("n", "<leader><tab>]", "<cmd>tabnext<cr>", { desc = "Next Tab" })
keymap("n", "<leader><tab>c", "<cmd>tabclose<cr>", { desc = "Close Tab" })
keymap("n", "<leader><tab>[", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })
