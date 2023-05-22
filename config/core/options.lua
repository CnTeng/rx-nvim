local opt = vim.opt

opt.autoindent = true -- Auto indent
opt.backup = false -- Disable backup
opt.clipboard = "unnamedplus" -- Connection to the system clipboard
opt.cmdheight = 1 -- Set command line height
opt.cursorline = true -- Highlight the text line of the cursor
opt.expandtab = true -- Enable the use of space in tab
opt.fileencoding = "utf-8" -- File content encoding for the buffer
opt.hlsearch = true -- Highlight all matches
opt.ignorecase = true -- Case insensitive searching
opt.mouse = "" -- Enable mouse support
opt.number = true -- Show numberline
opt.numberwidth = 2 -- Set numberline width
opt.pumheight = 10 -- Height of the pop up menu
opt.relativenumber = true -- Preserve indent structure as much as possible
opt.scrolloff = 8 -- Number of lines to keep above and below the cursor
opt.shiftwidth = 2 -- Number of space inserted for indentation
opt.showmode = false -- Disable showing modes in command line
opt.showtabline = 2 -- Always display tabline
opt.sidescrolloff = 8 -- Number of lines to keep left and right the cursor
opt.signcolumn = "yes" -- Always show the sign column
opt.smartcase = true -- Case sensitive searching when containing upper case characters
opt.smartindent = true -- Smart indent
opt.splitbelow = true -- Splitting a new window below the current one
opt.splitright = true -- Splitting a new window at the right of the current one
opt.swapfile = false -- Create a swapfile
opt.tabstop = 2 -- Number of space in a tab
opt.termguicolors = true -- Enable 24-bit RGB color in the TUI
opt.undofile = true -- Enable persistent undo
opt.updatetime = 300 -- Length of time to wait before triggering the plugin
opt.whichwrap = "h,l,<,>,[,],~" -- Set which key can jump to the next line
opt.wrap = false -- Disable wrapping of lines longer than the width of window
opt.writebackup = false -- Disable making a backup before overwriting a file