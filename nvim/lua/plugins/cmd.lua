return {
	"smilhey/ed-cmd.nvim",
	config = function()
		require("ed-cmd").setup({
			cmdline = {
				keymaps = { edit = "<C-f>", execute = "<CR>", close = { "<C-c>", "<Esc>" } },
			},
		})

		vim.keymap.set("c", "jk", function()
			require("ed-cmd.cmdline").enter_edit()
			vim.schedule(function()
				vim.cmd("silent norm lxh")
			end)
		end, {})
	end,
}
