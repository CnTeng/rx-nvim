local keymap = require("utils").keymap

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[ Normal ]]
-- Standed operations
keymap { "<leader>w", "<cmd>w<cr>", "Write" }
keymap { "<leader>q", "<cmd>q<cr>", "Quit" }
keymap { "<leader>h", "<cmd>nohlsearch<cr>", "No highlight" }
keymap { "<leader>fn", "<cmd>ene <bar> startinsert <cr>", "New file" }
keymap { "<C-s>", "<cmd>w!<cr>", "Force write" }
keymap { "<C-q>", "<cmd>q!<cr>", "Force quit" }

-- Better window movement
keymap { "gh", "<C-w>H", "Move window left" }
keymap { "gj", "<C-w>J", "Move window down" }
keymap { "gk", "<C-w>K", "Move window up" }
keymap { "gl", "<C-w>L", "Move window right" }

--[[ Insert ]]
-- Press jk fast to exit insert mode
keymap { mode = "i", "jk", "<esc>", "Exit insert mode" }

--[[ Visual && Select ]]
-- Stay in indent mode
keymap { mode = "v", "<", "<gv", "unindent line" }
keymap { mode = "v", ">", ">gv", "indent line" }

-- Move text up and down
keymap { mode = "v", "<A-j>", ":m .+1<cr>==", "Move text down" }
keymap { mode = "v", "<A-k>", ":m .-2<cr>==", "Move text up" }

--[[ Visual ]]
-- Move text up and down
keymap { mode = "x", "J", ":move '>+1<cr>gv-gv", "Move text down" }
keymap { mode = "x", "K", ":move '<-2<cr>gv-gv", "Move text up" }
keymap { mode = "x", "<A-k>", ":move '<-2<cr>gv-gv", "Move text up" }
keymap { mode = "x", "<A-j>", ":move '>+1<cr>gv-gv", "Move text down" }

--[[ Terminal ]]
-- Better terminal navigation
keymap { mode = "t", "<esc>", "<C-\\><C-n>", "Terminal normal mode" }
keymap { mode = "t", "<C-h>", "<C-\\><C-N><C-w>h", "Terminal left window navigation" }
keymap { mode = "t", "<C-j>", "<C-\\><C-N><C-w>j", "Terminal down window navigation" }
keymap { mode = "t", "<C-k>", "<C-\\><C-N><C-w>k", "Terminal up window navigation" }
keymap { mode = "t", "<C-l>", "<C-\\><C-N><C-w>l", "Terminal right window naviation" }
