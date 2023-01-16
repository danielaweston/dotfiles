local lsp = require("lsp-zero")
local telescope = require("telescope.builtin")

lsp.preset("recommended")

lsp.ensure_installed({
  "eslint",
  "gopls",
  "sumneko_lua",
  "terraformls",
  "tsserver",
  "yamlls",
})

lsp.configure("sumneko_lua", {
  settings = {
    Lua = {
      diagnostics = {
        globals = { "vim" }
      }
    }
  }
})

lsp.on_attach(function(_, bufnr)
  local opts = { buffer = bufnr, remap = false }

  vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)
  vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
  vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)
  vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
  vim.keymap.set("n", "gh", vim.lsp.buf.hover, opts)
  vim.keymap.set("i", "<C-h>", vim.lsp.buf.signature_help, opts)

  -- Telescope plugin
  vim.keymap.set("n", "gD", telescope.diagnostics, opts)
  vim.keymap.set("n", "gR", telescope.lsp_references, opts)

  -- Cycle through diagnostics
  vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
  vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)

  -- Cycle through errors only
  vim.keymap.set("n", "[e", function()
    vim.diagnostic.goto_next { severity = vim.diagnostic.severity.ERROR }
  end, opts)
  vim.keymap.set("n", "]e", function()
    vim.diagnostic.goto_prev { severity = vim.diagnostic.severity.ERROR }
  end, opts)
end)

lsp.setup()

vim.diagnostic.config({
  virtual_text = true,
})

-- Auto-format on save
vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.formatting_sync()]]
