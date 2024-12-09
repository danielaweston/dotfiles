return {
	{
		"neovim/nvim-lspconfig",
		lazy = false,
		dependencies = {
			"williamboman/mason.nvim",
			"williamboman/mason-lspconfig.nvim",
			"Afourcat/treesitter-terraform-doc.nvim",
			"artemave/workspace-diagnostics.nvim",
		},
		config = function()
			local mason = require("mason")
			local mason_lspconfig = require("mason-lspconfig")
			local lspconfig = require("lspconfig")
			local tfdoc = require("treesitter-terraform-doc")

			mason.setup({})
			mason_lspconfig.setup({
				ensure_installed = {
					"cssls",
					"docker_compose_language_service",
					"dockerls",
					"gopls",
					"jsonls",
					"lua_ls",
					"tailwindcss",
					"terraformls",
					"ts_ls",
					"yamlls",
				},
			})

			-- Default capabilities doesn't merge with native capabilities
			-- https://github.com/hrsh7th/cmp-nvim-lsp/issues/38
			local capabilities = vim.tbl_deep_extend(
				"force",
				vim.lsp.protocol.make_client_capabilities(),
				require("cmp_nvim_lsp").default_capabilities()
			)

			-- Automatically setup LSP for all installed LSP's
			mason_lspconfig.setup_handlers({
				-- Default handler for servers
				function(server_name)
					require("lspconfig")[server_name].setup({
						capabilities = capabilities,
						on_attach = function(client, bufnr)
							require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
						end,
					})
				end,
				-- Dedicated handlers for specific servers
				["ts_ls"] = function()
					lspconfig.ts_ls.setup({
						capabilities = capabilities,
						-- Use none-ls and prettierd for formatting instead
						on_init = function(client)
							client.server_capabilities.documentFormattingProvider = false
							client.server_capabilities.documentFormattingRangeProvider = false
						end,
						on_attach = function(client, bufnr)
							require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
						end,
					})
				end,
				["terraformls"] = function()
					lspconfig.terraformls.setup({
						capabilities = capabilities,
						filetypes = {
							"terraform",
							"terraform-vars",
							"hcl",
						},
						on_attach = function(client, bufnr)
							tfdoc.setup({
								command_name = "OpenDoc",
								url_opener_command = "!open",
								jump_argument = true,
							})

							vim.keymap.set("n", "<leader>td", "<cmd>OpenDoc<CR>")

							require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
						end,
					})
				end,
				["lua_ls"] = function()
					lspconfig.lua_ls.setup({
						capabilities = capabilities,
						settings = {
							Lua = {
								diagnostics = {
									globals = { "vim" },
								},
							},
						},
						on_attach = function(client, bufnr)
							require("workspace-diagnostics").populate_workspace_diagnostics(client, bufnr)
						end,
					})
				end,
			})

			-- Diagnostic keymaps
			vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float)
			vim.keymap.set("n", "[d", vim.diagnostic.goto_prev)
			vim.keymap.set("n", "]d", vim.diagnostic.goto_next)

			-- Use LspAttach autocommand to only map the following keys
			-- after the language server attaches to the current buffer
			vim.api.nvim_create_autocmd("LspAttach", {
				group = vim.api.nvim_create_augroup("UserLspConfig", {}),

				callback = function(ev)
					local opts = { buffer = ev.buf }

					vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
					vim.keymap.set("i", "<C-k>", vim.lsp.buf.signature_help, opts)
					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gD", vim.lsp.buf.type_definition, opts)
					vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, opts)

					-- Fixes broken/flickering colors (not all LSP's support semantic tokens)
					-- https://github.com/neovim/nvim-lspconfig/issues/2552
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					client.server_capabilities.semanticTokensProvider = nil
				end,
			})
		end,
	},
}
