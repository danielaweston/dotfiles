local telescope = require("telescope")
local builtin = require("telescope.builtin")
local live_grep_args_actions = require("telescope-live-grep-args.actions")

vim.keymap.set("n", "<C-p>", builtin.git_files, {})
vim.keymap.set("n", "<leader>pb", builtin.buffers, {})
vim.keymap.set("n", "<leader>pf", builtin.find_files, {})
vim.keymap.set("n", "<leader>pg", telescope.extensions.live_grep_args.live_grep_args, {})

telescope.setup({
  defaults = {
    path_display = { "truncate" },
  },
  extensions = {
    live_grep_args = {
      auto_quoting = true,
      mappings = {
        i = {
          ["<C-k>"] = live_grep_args_actions.quote_prompt(),
        },
      },
    },
  },
})

telescope.load_extension("live_grep_args")
