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
