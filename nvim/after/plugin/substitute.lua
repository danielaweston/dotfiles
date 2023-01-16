local substitute = require("substitute")

substitute.setup({})

vim.keymap.set("n", "s", substitute.operator)
vim.keymap.set("n", "ss", substitute.line)
vim.keymap.set("n", "S", substitute.eol)
vim.keymap.set("x", "s", substitute.visual)
