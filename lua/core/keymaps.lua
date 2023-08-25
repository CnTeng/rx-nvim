local function keymap(mode, lhs, rhs, desc)
  vim.keymap.set(mode, lhs, rhs, {
    desc = desc,
  })
end

-- Remap space as leader key
vim.g.mapleader = " "
vim.g.maplocalleader = " "

--[[ Normal ]]
-- Standed operations
keymap("n", "<leader>w", "<cmd>w<cr>", "Write")
keymap("n", "<leader>q", "<cmd>q<cr>", "Quit")
keymap("n", "<leader>h", "<cmd>nohlsearch<cr>", "No highlight")
keymap("n", "<leader>fn", "<cmd>ene <bar> startinsert <cr>", "New file")
keymap("n", "<C-s>", "<cmd>w!<cr>", "Force write")
keymap("n", "<C-q>", "<cmd>q!<cr>", "Force quit")

-- Better window movement
keymap("n", "gh", "<C-w>H", "Move window left")
keymap("n", "gj", "<C-w>J", "Move window down")
keymap("n", "gk", "<C-w>K", "Move window up")
keymap("n", "gl", "<C-w>L", "Move window right")

--[[ Insert ]]
-- Press jk fast to exit insert mode
keymap("i", "jk", "<esc>", "Exit insert mode")

--[[ Visual && Select ]]
-- Stay in indent mode
keymap("v", "<", "<gv", "unindent line")
keymap("v", ">", ">gv", "indent line")

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<cr>==", "Move text down")
keymap("v", "<A-k>", ":m .-2<cr>==", "Move text up")

--[[ Visual ]]
-- Move text up and down
keymap("x", "J", ":move '>+1<cr>gv-gv", "Move text down")
keymap("x", "K", ":move '<-2<cr>gv-gv", "Move text up")
keymap("x", "<A-k>", ":move '<-2<cr>gv-gv", "Move text up")
keymap("x", "<A-j>", ":move '>+1<cr>gv-gv", "Move text down")

--[[ Terminal ]]
-- Better terminal navigation
keymap("t", "<esc>", "<C-\\><C-n>", "Terminal normal mode")
keymap("t", "<C-h>", "<C-\\><C-N><C-w>h", "Terminal left window navigation")
keymap("t", "<C-j>", "<C-\\><C-N><C-w>j", "Terminal down window navigation")
keymap("t", "<C-k>", "<C-\\><C-N><C-w>k", "Terminal up window navigation")
keymap("t", "<C-l>", "<C-\\><C-N><C-w>l", "Terminal right window naviation")
