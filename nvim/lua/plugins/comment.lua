return {
  "numToStr/Comment.nvim",
  lazy = false,
  dependencies = {
    "JoosepAlviste/nvim-ts-context-commentstring",
  },
  config = function()
    local comment = require("Comment")
    local tsContextCommentString = require('ts_context_commentstring')
    local ft = require("Comment.ft")

    tsContextCommentString.setup({
      enable_autocmd = false,
    })

    comment.setup({
      pre_hook = require('ts_context_commentstring.integrations.comment_nvim').create_pre_hook(),
    })

    ft({
      "hcl",
      "terraform",
      "yaml",
    }, {
      "#%s",
      "/*%s*/",
    })
  end,
}
