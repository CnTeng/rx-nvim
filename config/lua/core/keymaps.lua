local keymap = vim.keymap.set

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Standed operations
keymap("n", "<leader>w", "<cmd>w<cr>", { desc = "Write" })
keymap("n", "<leader>q", "<cmd>q<cr>", { desc = "Quit" })
keymap("n", "<leader>h", "<cmd>nohlsearch<cr>", { desc = "No highlight" })
keymap("n", "<leader>fn", "<cmd>ene <bar> startinsert <cr>", { desc = "New file" })
keymap("n", "<C-s>", "<cmd>w!<cr>", { desc = "Force write" })
keymap("n", "<C-q>", "<cmd>q!<cr>", { desc = "Force quit" })

-- Stay in indent mode
keymap("v", "<", "<gv", { desc = "unindent line" })
keymap("v", ">", ">gv", { desc = "indent line" })

-- Move text up and down
keymap("x", "J", ":move '>+1<cr>gv-gv", { desc = "Move text down" })
keymap("x", "K", ":move '<-2<cr>gv-gv", { desc = "Move text up" })

-- Better terminal
keymap("t", "<C-/>", "<C-\\><C-n>", { desc = "Terminal normal mode" })
