-- Indentation options
local tabsize = 2
vim.opt.tabstop = tabsize
vim.opt.softtabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.expandtab = true
vim.opt.smarttab = true

-- Line number options
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.numberwidth = 2

-- Case semi-sensitive search
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- Visual options
vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"
vim.opt.cursorline = true
vim.opt.termguicolors = true
vim.opt.splitbelow = true
vim.opt.splitright = true

-- Undo history
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true
vim.opt.swapfile = false
vim.opt.backup = false

-- Misc options
vim.opt.autoread = true                -- Re-read files when changed outside of vim
vim.opt.clipboard = "unnamedplus"      -- Use system clipboard
vim.opt.wildmode = "longest:full,full" -- Command-line completion mode

vim.opt.updatetime = 50
