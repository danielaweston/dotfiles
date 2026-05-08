return {
  {
    "mhiro2/tf-docs.nvim",
    ft = { "terraform", "hcl" },
    config = function()
      require("tf-docs").setup()

      -- Tf Docs keymaps
      vim.keymap.set("n", "<leader>td", "<CMD>TfDocOpen<CR>", { desc = "Terraform: open docs" })
      vim.keymap.set("n", "<leader>tl", "<CMD>TfDocList<CR>", { desc = "Terraform: open list" })

      -- Telescope Terraform Docs
      vim.keymap.set(
        "n",
        "<leader>ta",
        "<CMD>Telescope terraform_doc full_name=hashicorp/aws<CR>",
        { desc = "Terraform: open aws docs" }
      )
    end,
  },
}
