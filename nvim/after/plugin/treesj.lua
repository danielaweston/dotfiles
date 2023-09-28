local treesj = require('treesj')

treesj.setup({
  use_default_keymaps = false,
  max_join_length = 1000,
})

vim.keymap.set('n', 'gaw', treesj.toggle)
vim.keymap.set('n', 'gaW', function()
  treesj.toggle({ split = { recursive = true } })
end)
