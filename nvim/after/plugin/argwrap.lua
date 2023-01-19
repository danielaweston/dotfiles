vim.g.argwrap_padded_braces = '{'
vim.g.argwrap_tail_comma_braces = '[{'

vim.keymap.set("n", "gaw", vim.cmd.ArgWrap)
