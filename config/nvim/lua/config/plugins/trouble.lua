require("trouble").setup({
  fold_open = "v",
  fold_closed = ">",
  indent_lines = false,
  signs = {
    error = "error",
    warning = "warn",
    hint = "hint",
    information = "info",
    other = "misc",
  },
  use_lsp_diagnostic_signs = false,
})

vim.api.nvim_set_keymap(
  "n",
  "<Leader>cx",
  '<Cmd>Trouble<CR>',
  { noremap = true, silent = true }
)
