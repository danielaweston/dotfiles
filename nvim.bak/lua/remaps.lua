-- Rebind leader to space
vim.g.mapleader = " "

-- Easy escape in Insert mode
vim.keymap.set("i", "jk", "<ESC>")

-- Clear search highlighting
vim.keymap.set("n", "<leader>/", ":noh<CR>")

-- View files in Netrw
vim.keymap.set("n", "<leader>pv", ":Ex<CR>")

-- Bind redo to r
vim.keymap.set("n", "r", "<C-r>")

-- Center after movements
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- Move visual blocks
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Reselect visual selection after indenting
vim.keymap.set("v", "<", "<gv")
vim.keymap.set("v", ">", ">gv")

-- Easy buffer substitution
vim.keymap.set("n", "<leader>s", ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>")
vim.keymap.set("v", "<leader>s", 'y:%s/<C-r>"/<C-r>"/gI<Left><Left><Left>')

-- Open project finder
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/.local/bin/tmuxer<CR>")
