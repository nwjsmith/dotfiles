require("nvim-treesitter.configs").setup {
  highlight = { enable = true },
}

require "nvim-treesitter.parsers".get_parser_configs().clojure = {
  install_info = {
    url = "~/Code/sogaiu/tree-sitter-clojure",
    files = { "src/parser.c" }
  }
}

