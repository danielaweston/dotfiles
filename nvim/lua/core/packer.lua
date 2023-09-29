-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require("packer").startup(function(use)
  -- Packer can manage itself
  use("wbthomason/packer.nvim")

  -- Coloring
  use("Mofiqul/vscode.nvim")

  -- Plugins
  use("gbprod/substitute.nvim")
  use("mbbill/undotree")
  use("windwp/nvim-autopairs")
  use("windwp/nvim-ts-autotag")
  use("numToStr/Comment.nvim")
  use("ThePrimeagen/harpoon")

  use("tpope/vim-fugitive")
  use("tpope/vim-repeat")
  use("tpope/vim-surround")

  use("zbirenbaum/copilot.lua")

  use({
    "nvim-telescope/telescope.nvim",
    tag = "0.1.1",
    requires = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope-live-grep-args.nvim",
    }
  })

  use({
    "folke/trouble.nvim",
    requires = {
      "nvim-tree/nvim-web-devicons",
    }
  })

  use({
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    requires = {
      "Afourcat/treesitter-terraform-doc.nvim",
    }
  })

  use("Wansmer/treesj")

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

  -- For React/NextJS/Typescript
  use({
    "jose-elias-alvarez/null-ls.nvim",
    requires = {
      "MunifTanjim/eslint.nvim",
      "MunifTanjim/prettier.nvim",
    }
  })
end)
