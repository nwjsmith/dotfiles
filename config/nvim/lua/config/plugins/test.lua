
vim.g["test#strategy"] = "dispatch"
vim.g["test#python#runner"] = "pytest"

options = { noremap = true, silent = true }

vim.api.nvim_set_keymap(
  "n",
  "<Leader>tt",
  "<Cmd>TestNearest<CR>",
  options
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>tf",
  "<Cmd>TestFile<CR>",
  options
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>ts",
  "<Cmd>TestSuite<CR>",
  options
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>tl",
  "<Cmd>TestLast<CR>",
  options
)
