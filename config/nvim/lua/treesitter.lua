require("nvim-treesitter.configs").setup {
  highlight = { enable = true },
}

require "nvim-treesitter.parsers".get_parser_configs().clojure = {
  install_info = {
    url = "~/Code/sogaiu/tree-sitter-clojure",
    files = { "src/parser.c" }
  }
}


-- `TSAnnotation`
-- For C++/Dart attributes, annotations that can be attached to the code to
-- denote some kind of meta information.

-- `TSAttribute`
-- (unstable) TODO: docs

-- `TSBoolean`
-- For booleans.

-- `TSCharacter`
-- For characters.

-- `TSComment`
-- For comment blocks.

-- `TSConstructor`
-- For constructor calls and definitions: `{}` in Lua, and Java constructors.

-- `TSConditional`
-- For keywords related to conditionnals.

-- `TSConstant`
-- For constants

-- `TSConstBuiltin`
-- For constant that are built in the language: `nil` in Lua.

-- `TSConstMacro`
-- For constants that are defined by macros: `NULL` in C.

-- `TSError`
-- For syntax/parser errors.

-- `TSException`
-- For exception related keywords.

-- `TSField`
-- For fields.

-- `TSFloat`
-- For floats.

-- `TSFunction`
-- For function (calls and definitions).

-- `TSFuncBuiltin`
-- For builtin functions: `table.insert` in Lua.

-- `TSFuncMacro`
-- For macro defined fuctions (calls and definitions): each `macro_rules` in
-- Rust.

-- `TSInclude`
-- For includes: `#include` in C, `use` or `extern crate` in Rust, or `require`
-- in Lua.

-- `TSKeyword`
-- For keywords that don't fall in previous categories.

-- `TSKeywordFunction`
-- For keywords used to define a fuction.

-- `TSLabel`
-- For labels: `label:` in C and `:label:` in Lua.

-- `TSMethod`
-- For method calls and definitions.

-- `TSNamespace`
-- For identifiers referring to modules and namespaces.

-- `TSNone`
-- TODO: docs

-- `TSNumber`
-- For all numbers 

-- `TSOperator`
-- For any operator: `+`, but also `->` and `*` in C.

-- `TSParameter`
-- For parameters of a function.

-- `TSParameterReference`
-- For references to parameters of a function.

-- `TSProperty`
-- Same as `TSField`.

-- `TSPunctDelimiter`
-- For delimiters ie: `.`

-- `TSPunctBracket`
-- For brackets and parens.

-- `TSPunctSpecial`
-- For special punctutation that does not fall in the catagories before.

-- `TSRepeat`
-- For keywords related to loops.

-- `TSString`
-- For strings.

-- `TSStringRegex`
-- For regexes.

-- `TSStringEscape`
-- For escape characters within a string.

-- `TSSymbol`
-- For identifiers referring to symbols or atoms.

-- `TSTag`
-- Tags like html tag names.

-- `TSTagDelimiter`
-- Tag delimiter like `<` `>` `/`

-- `TSText`
-- For strings considered text in a markup language.

-- `TSEmphasis`
-- For text to be represented with emphasis.

-- `TSUnderline`
-- For text to be represented with an underline.

-- `TSStrike`
-- For strikethrough text.

-- `TSTitle`
-- Text that is part of a title.

-- `TSLiteral`
-- Literal text.

-- `TSURI`
-- Any URI like a link or email.

-- `TSType`
-- For types.

-- `TSTypeBuiltin`
-- For builtin types.

-- `TSVariable`
-- Any variable name that does not have another highlight.

-- `TSVariableBuiltin`
-- Variable names that are defined by the languages, like `this` or `self`.
