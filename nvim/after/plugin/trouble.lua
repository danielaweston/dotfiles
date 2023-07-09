local trouble = require("trouble")

trouble.setup({})

vim.keymap.set("n", "<leader>xx", "<cmd>TroubleToggle<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xd", "<cmd>TroubleToggle workspace_diagnostics<CR>", { silent = true, noremap = true })
vim.keymap.set("n", "<leader>xc", "<cmd>TroubleToggle quickfix<CR>", { silent = true, noremap = true })
