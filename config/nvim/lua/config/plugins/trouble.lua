require("trouble").setup({})

vim.api.nvim_set_keymap(
  "n",
  "<Leader>cx",
  "<Cmd>Trouble lsp_document_diagnostics<CR>",
  { noremap = true, silent = true }
)

vim.api.nvim_set_keymap(
  "n",
  "<Leader>cX",
  "<Cmd>Trouble lsp_workspace_diagnostics<CR>",
  { noremap = true, silent = true }
)
