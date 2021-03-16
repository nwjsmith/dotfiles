require("nvim-treesitter.configs").setup {
  ensure_installed = {
    "bash",
    "clojure",
    "python",
    "ruby",
    "rust",
    "typescript",
  },
  highlight = { enable = true },
}
