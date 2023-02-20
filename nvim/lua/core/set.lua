vim.opt.number = true
vim.opt.relativenumber = true

local tabsize = 2
vim.opt.tabstop = tabsize
vim.opt.softtabstop = tabsize
vim.opt.shiftwidth = tabsize
vim.opt.expandtab = true
vim.opt.smarttab = true
vim.opt.backspace = "indent,eol,start"

local indentkeys = "0{,0},0),0],:,!^F,o,O,e"
vim.opt.cindent = true
vim.opt.cinkeys = indentkeys
vim.opt.indentkeys = indentkeys

vim.opt.ignorecase = true
vim.opt.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.autoread = true
vim.opt.incsearch = true
vim.opt.history = 1000

vim.opt.clipboard = "unnamed"
vim.opt.wildmode = 'longest:full,full'

vim.opt.wrap = false
vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"
vim.opt.colorcolumn = "80"

vim.opt.updatetime = 50
