require("trouble").setup({
  {
    fold_open = "v",
    fold_closed = ">",
    indent_lines = false,
    signs = {
      error = "error",
      warning = "warn",
      hint = "hint",
      information = "info",
    },
    use_lsp_diagnostic_signs = false,
  },
})
