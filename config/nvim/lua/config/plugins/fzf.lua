function fzfmap(lhs, command)
  options = { noremap = true, silent = true }
  rhs = "<Cmd>lua require('fzf-lua')." .. command .. "<CR>"
  vim.api.nvim_set_keymap("n", lhs, rhs, options)
end

fzfmap("<Leader>ff", "files()")
fzfmap("<Leader>/", "grep_project()")
