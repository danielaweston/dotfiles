return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  cmd = "Copilot",
  build = ":Copilot auth",
  config = function()
    local copilot = require("copilot")
    local copilotSuggestions = require("copilot.suggestion")

    copilot.setup({
      suggestion = {
        auto_trigger = true,
        keymap = {
          accept = false,
        },
      },
    })

    vim.keymap.set("i", "<tab>", function()
      if copilotSuggestions.is_visible() then
        copilotSuggestions.accept()
      else
        vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<tab>", true, false, true), "n", false)
      end
    end, { desc = "Super Tab" })
  end,
}
