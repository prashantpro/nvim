local M = {}

function M.setup()
  local comment = require("Comment")

  comment.setup({
    --  ignore = "^$",
    --  pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
  })
end

return M
