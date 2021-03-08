-- Spacemacs is right
vim.g.mapleader = " "

-- Live in the present
vim.o.termguicolors = true

-- Relative line numbers in normal mode
vim.wo.number = true
vim.wo.relativenumber = true

-- Use ZSH for shell
vim.o.shell = "/usr/bin/env zsh"

-- Relative line numbers in normal mode
vim.wo.numberwidth = 4

-- Gruvbox is nice
vim.o.background = "light"
vim.cmd("colorscheme gruvbox")

-- A more useful modeline
require("modeline")

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

require("treesitter")
require("telescope-configuration")
require("lsp")
require("local")
