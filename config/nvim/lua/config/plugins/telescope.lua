require("telescope").setup({})

options = { noremap = true, silent = true }

vim.api.nvim_set_keymap(
  "n",
  "<Leader>ca",
  "<Cmd>Telescope lsp_code_actions<CR>",
  options
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>cj",
  "<Cmd>Telescope lsp_workspace_symbols<CR>",
  options
)

vim.api.nvim_set_keymap(
  "n",
  "gD",
  "<Cmd>Telescope lsp_definitions<CR>",
  options
)

vim.api.nvim_set_keymap("n", "cD", "<Cmd>Telescope lsp_references<CR>", options)

vim.api.nvim_set_keymap(
  "n",
  "ct",
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
