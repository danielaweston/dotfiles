return {
  'nvim-lualine/lualine.nvim',
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  config = function()
    local lualine = require("lualine")

    lualine.setup({
      options = {
        globalstatus = true,
        theme = 'codedark',
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          'branch',
          'diff',
          {
            'diagnostics',
            sources = { 'nvim_workspace_diagnostic' },
          },
        },
        lualine_c = { 'filename' },
        lualine_x = { 'filetype', 'encoding' },
        lualine_y = {},
        lualine_z = {},
      },
    })
  end
}
