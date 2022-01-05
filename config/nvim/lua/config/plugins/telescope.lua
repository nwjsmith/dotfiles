require("telescope").setup({})

options = { noremap = true, silent = true }

vim.api.nvim_set_keymap(
  "n",
  "<Leader>/",
  "<Cmd>Telescope live_grep<CR>",
  options
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>ff",
  "<Cmd>Telescope find_files<CR>",
  options
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>fb",
  "<Cmd>Telescope file_browser<CR>",
  options
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>ft",
  "<Cmd>Telescope builtins<CR>",
  options
)

