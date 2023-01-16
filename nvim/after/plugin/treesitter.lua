local treesitter = require("nvim-treesitter.configs")

treesitter.setup {
  -- A list of parser names, or "all"
  ensure_installed = {
    "bash",
    "dockerfile",
    "go",
    "hcl",
    "help",
    "json",
    "lua",
    "javascript",
    "typescript",
    "vim",
    "yaml",
  },

  -- Install parsers synchronously (only applied to `ensure_installed`)
  sync_install = false,

  -- Automatically install missing parsers when entering buffer
  -- Recommendation: set to false if you don"t have `tree-sitter` CLI installed locally
  auto_install = true,

  highlight = {
    enable = true,
  },

  textobjects = {
    select = {
      enable = true,
      lookahead = true,
      include_surrounding_whitespace = true,
      keymaps = {
        ["aa"] = "@parameter.outer",
        ["ia"] = "@parameter.inner",
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
      selection_modes = {
        ["@function.outer"] = "V",
        ["@class.outer"] = "V",
      },
    },
  },
}
