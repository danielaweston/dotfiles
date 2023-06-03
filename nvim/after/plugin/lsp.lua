local lsp = require("lsp-zero")
local tfdoc = require("treesitter-terraform-doc")

lsp.preset("recommended")

lsp.ensure_installed({
  "eslint",
  "gopls",
  "lua_ls",
  "terraformls",
  "tsserver",
  "yamlls",
})

lsp.nvim_workspace()

lsp.configure("terraformls", {
  filetypes = {
    "terraform",
    "terraform-vars",
    "hcl",
  },
  on_attach = function()
    tfdoc.setup({
      command_name       = "OpenDoc",
      url_opener_command = "!open",
      jump_argument      = true
    })

    vim.keymap.set("n", "<leader>td", "<cmd>OpenDoc<CR>")
  end,
})

lsp.configure("yamlls", {
  settings = {
    yaml = {
      keyOrdering = false,
      customTags = {
        "!Base64 scalar",
        "!Cidr scalar",
        "!And sequence",
        "!Equals sequence",
        "!If sequence",
        "!Not sequence",
        "!Or sequence",
        "!Condition scalar",
        "!FindInMap sequence",
        "!GetAtt scalar",
        "!GetAtt sequence",
        "!GetAZs scalar",
        "!ImportValue scalar",
        "!Join sequence",
        "!Select sequence",
        "!Split sequence",
        "!Sub scalar",
        "!Transform mapping",
        "!Ref scalar",
      },
    }
  }
})

lsp.setup_nvim_cmp({
  mapping = lsp.defaults.cmp_mappings({
    ["<Tab>"] = vim.NIL,
    ["<S-Tab>"] = vim.NIL,
  }),
  sources = {
    { name = "path" },
    { name = "nvim_lsp", keyword_length = 1 },
    { name = "luasnip",  keyword_length = 2 },
    { name = "buffer",   keyword_length = 3 },
  },
})

lsp.on_attach(function(client, bufnr)
  local opts = { buffer = bufnr, remap = false }

  -- LSP actions
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
  vim.keymap.set("n", "gl", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

  -- Cycle through diagnostics
  vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts)

  -- Cycle through errors only
  vim.keymap.set("n", "[e", function()
    vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
  end, opts)
  vim.keymap.set("n", "]e", function()
    vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
  end, opts)

  -- Apply formating options to not continue comments with "o" or "<CR>"
  vim.opt.formatoptions:remove("o")
  vim.opt.formatoptions:remove("r")

  -- Autoformat on save
  vim.cmd("au BufWritePre <buffer> lua vim.lsp.buf.format()")

  -- Issues with semantic tokens provider
  -- https://github.com/neovim/nvim-lspconfig/issues/2552
  if client.server_capabilities.semanticTokensProvider then
    client.server_capabilities.semanticTokensProvider = nil
  end
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})
