-- Start with Copilot enabled
vim.g.copilot_enabled = 1

-- Move through suggestions
vim.keymap.set("i", "<M-j>", "<Plug>(copilot-next)")
vim.keymap.set("i", "<M-k>", "<Plug>(copilot-previous)")

-- Open copilot panel
vim.keymap.set({ "i", "n" }, "<M-p>", "<cmd>:Copilot panel<CR>")

-- Toggle copilot
vim.keymap.set({ "i", "n" }, "<M-g>", "<cmd>:lua Toggle_Copilot()<CR>")

function Toggle_Copilot()
  if vim.g.copilot_enabled == 1 then
    vim.cmd("call copilot#Dismiss()")
    vim.cmd("Copilot disable")
  else
    vim.cmd("call copilot#Suggest()")
    vim.cmd("Copilot enable")
  end
end
