return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		vim.keymap.set("n", "<leader>a", function()
			harpoon:list():add()
		end)
		vim.keymap.set("n", "<leader>h", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		vim.keymap.set("n", "<M-j>", function()
			harpoon:list():replace_at(1)
		end)
		vim.keymap.set("n", "<M-k>", function()
			harpoon:list():replace_at(2)
		end)
		vim.keymap.set("n", "<M-l>", function()
			harpoon:list():replace_at(3)
		end)
		vim.keymap.set("n", "<M-h>", function()
			harpoon:list():replace_at(4)
		end)

		vim.keymap.set("n", "<C-j>", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<C-k>", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<C-l>", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<C-h>", function()
			harpoon:list():select(4)
		end)

		vim.keymap.set("n", "<leader>j", function()
			harpoon:list():select(1)
		end)
		vim.keymap.set("n", "<leader>k", function()
			harpoon:list():select(2)
		end)
		vim.keymap.set("n", "<leader>l", function()
			harpoon:list():select(3)
		end)
		vim.keymap.set("n", "<leader>;", function()
			harpoon:list():select(4)
		end)
	end,
}