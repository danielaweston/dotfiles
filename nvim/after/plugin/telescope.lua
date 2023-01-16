local telescope = require("telescope")
local builtin = require("telescope.builtin")

vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", builtin.live_grep, {})

telescope.setup({
  defaults = {
    path_display = { "truncate" },
  },
  pickers = {
    buffers = {
      initial_mode = "normal",
    },
    diagnostics = {
      initial_mode = "normal",
    },
    git_commits = {
      initial_mode = "normal",
    },
    git_branches = {
      initial_mode = "normal",
    },
    lsp_references = {
      initial_mode = "normal",
    },
  },
})
