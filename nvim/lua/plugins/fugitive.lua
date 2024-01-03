return {
  "tpope/vim-fugitive",
  config = function()
    vim.keymap.set("n", "<leader>gb", ":Git blame<CR>")

    -- Toggle git status window
    -- https://github.com/tpope/vim-fugitive/issues/1274
    vim.keymap.set("n", "<leader>gs", function()
      local winids = vim.api.nvim_list_wins()
      for _, id in pairs(winids) do
        local status = pcall(vim.api.nvim_win_get_var, id, "fugitive_status")
        if status then
          vim.api.nvim_win_close(id, false)
          return
        end
      end
      vim.cmd("Git")
    end)
  end,
}
