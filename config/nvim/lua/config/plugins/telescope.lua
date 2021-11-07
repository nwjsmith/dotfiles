require('telescope').setup({})

options = { noremap = true, silent = true }

vim.api.nvim_set_keymap(
  "n",
  "<Leader>ca",
  "<Cmd>Telescope lsp_code_actions<CR>",
  options
)

vim.api.nvim_set_keymap(
  "v",
  "<Leader>ca",
  "<Cmd>Telescope lsp_range_code_actions<CR>",
  options
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>cj",
  "<Cmd>Telescope lsp_definitions<CR>",
  options
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>cd",
  "<Cmd>Telescope lsp_type_definitions<CR>",
  options
)

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
