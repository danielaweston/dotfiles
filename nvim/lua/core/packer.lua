-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Coloring
  use("rose-pine/neovim")

  -- Plugins
  use("gbprod/substitute.nvim")
  use("mbbill/undotree")
  use("windwp/nvim-autopairs")
  use("FooSoft/vim-argwrap")
  use("metakirby5/codi.vim")
  use("numToStr/Comment.nvim")

  use("tpope/vim-fugitive")
  use("tpope/vim-repeat")
  use("tpope/vim-surround")

  use("github/copilot.vim")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    }
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "nvim-treesitter/nvim-treesitter-textobjects",
    }
  })

  use({
    "VonHeikemen/lsp-zero.nvim",
    branch = "v1.x",
    requires = {
      -- LSP Support
      { "neovim/nvim-lspconfig" },
      { "williamboman/mason.nvim" },
      { "williamboman/mason-lspconfig.nvim" },

      -- Autocompletion
      { "hrsh7th/nvim-cmp" },
      { "hrsh7th/cmp-buffer" },
      { "hrsh7th/cmp-path" },
      { "saadparwaiz1/cmp_luasnip" },
      { "hrsh7th/cmp-nvim-lsp" },
      { "hrsh7th/cmp-nvim-lua" },

      -- Snippets
      { "L3MON4D3/LuaSnip" },
      { "rafamadriz/friendly-snippets" },
    }
  })
end)
