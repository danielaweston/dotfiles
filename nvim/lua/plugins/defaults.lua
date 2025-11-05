-- since this is just an example spec, don't actually load anything here and return an empty spec
-- stylua: ignore
if true then return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        hidden = true, -- Show hidden files in file pickers
        ignored = true, -- Show files ignored by `.gitignore`
      },
    },
  },
  {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
      cmdline = {
        view = "cmdline"
      }
    }
  },
  {
    "folke/flash.nvim",
    enabled = false
  },
} end
