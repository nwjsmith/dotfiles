require("trouble").setup({})

vim.api.nvim_set_keymap(
  "n",
  "<Leader>cx",
  "<Cmd>Trouble<CR>",
  { noremap = true, silent = true }
)
