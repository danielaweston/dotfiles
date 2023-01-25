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
    vimgrep_arguments = {
      "rg",
      "--color=never",
      "--no-heading",
      "--with-filename",
      "--line-number",
      "--column",
      "--smart-case",
      "--hidden",
      "--trim",
      "--glob",
      "!**/.git/*",
    },
    mappings = {
      i = {
        ["<C-u>"] = false,
      },
    },
  },
  pickers = {
    find_files = {
      find_command = {
        "rg",
        "--files",
        "--hidden",
        "--glob",
        "!**/.git/*",
      },
    },
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
