-- Config courtesy of https://github.com/citosid/vim/blob/3dbe530186451342973be0fddb6e2e10099f1240/lua/plugins/none-ls.lua

local eslintOpts = {
	condition = function(utils)
		return utils.root_has_file({ ".eslintrc.js", ".eslintrc.json", ".eslintrc.cjs" })
	end,
}

return {
	{
		"jay-babu/mason-null-ls.nvim",
		event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		config = function()
			require("mason-null-ls").setup({
				-- Each of one of these needs to be added in the configuration for none-ls.nvim
				ensure_installed = {
					-- Diagnostics
					"markdownlint", -- This is both, formatter and diagnostics

					-- Formatters
					"black",
					"isort",
					"prettier",
					"stylua",

					-- Deprecated LSPs in none-ls plugin
					"beautysh",
					"eslint_d",
					"jq",
				},
			})
		end,
	},
	{
		"nvimtools/none-ls.nvim",
		dependencies = {
			"jay-babu/mason-null-ls.nvim",
			"nvimtools/none-ls-extras.nvim",
		},
		event = { "BufReadPre", "BufNewFile" },
		lazy = true,
		opts = function(_, opts)
			local nls = require("null-ls")
			opts.sources = vim.list_extend(opts.sources or {}, {
				-- These come from the configuration for mason-null-ls.nvim

				-- Diagnostics
				nls.builtins.diagnostics.markdownlint,

				-- Formatter
				nls.builtins.formatting.markdownlint,
				nls.builtins.formatting.prettier,
				nls.builtins.formatting.stylua,

				-- Formatters based-off the new none-ls-extras plugin
				require("none-ls.code_actions.eslint_d").with(eslintOpts),
				require("none-ls.diagnostics.eslint_d").with(eslintOpts),
				require("none-ls.formatting.eslint_d").with(eslintOpts),
			})

			opts.on_attach = function(current_client, bufnr)
				if current_client.supports_method("textDocument/formatting") then
					vim.api.nvim_clear_autocmds({ buffer = bufnr })
					vim.api.nvim_create_autocmd("BufWritePre", {
						buffer = bufnr,
						callback = function()
							vim.lsp.buf.format({
								filter = function(client)
									-- only use null-ls for formatting instead of lsp server
									return client.name == "null-ls"
								end,
								bufnr = bufnr,
								async = false,
							})
						end,
					})
				end
			end
		end,
	},
}
