-- Spacemacs is right
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Live in the present
vim.o.termguicolors = true

-- Relative line numbers in normal mode
vim.wo.number = true
vim.wo.relativenumber = true

-- Relative line numbers in normal mode
vim.wo.numberwidth = 4

-- Gruvbox is nice
vim.o.background = "light"
vim.cmd [[
  colorscheme gruvbox8
  autocmd ColorScheme * highlight Sneak guifg=#fbf1c7 guibg=#b16286 ctermfg=229 ctermbg=237
  autocmd ColorScheme * highlight SneakScope guifg=#3c3836 guibg=#ebdbb2 ctermfg=237 ctermbg=223
]]
vim.g.gruvbox_italicize_strings = 0

-- A more useful modeline
vim.g.lightline = { colorscheme = "gruvbox8_light" }
vim.opt.showmode = false

-- Show trailing whitespace
vim.wo.list = true

-- Wrap on word boundary
vim.wo.linebreak = true

-- No lines longer than 80 characters, old man
vim.wo.colorcolumn = "81"

-- Show matching bracket when one is inserted
vim.g.showmatch = true

-- Round to the nearest indent when using > or <
vim.g.shiftround = 2

-- You're using Git, right?
vim.o.backup = false
vim.o.writebackup = false
vim.bo.swapfile = false

-- Write file after every command
vim.o.autowrite = true

-- Ignore case unless the pattern contains uppercase letters
vim.o.smartcase = true

-- Complete with proper casing
vim.bo.infercase = true

-- Allow the mouse everywhere
vim.o.mouse = "a"

-- Use the system clipboard
vim.o.clipboard = "unnamedplus"

-- Don't start completing without my consent
vim.o.completeopt = "menuone,noinsert,noselect"

vim.g['prettier#autoformat_config_present'] = 1

require("treesitter")
require("telescope-configuration")
require("lsp")
require("local")
