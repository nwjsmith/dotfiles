vim.api.nvim_set_keymap(
  "n",
  "<Leader>ff",
  '<Cmd>lua require("fzf-lua").files()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>/",
  '<Cmd>lua require("fzf-lua").live_grep()<CR>',
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>/",
  '<Cmd>lua require("fzf-lua").live_grep()<CR>',
  { noremap = true, silent = true }
)
