local comment = require("Comment")
local ft = require("Comment.ft")

comment.setup()

ft({
  "hcl",
  "terraform",
  "yaml",
}, {
  "#%s",
  "/*%s*/",
})
