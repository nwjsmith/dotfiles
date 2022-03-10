vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- You are using Git, right?
vim.o.backup = false
vim.o.writebackup = false
vim.o.swapfile = false

vim.o.mouse = "a"

vim.o.clipboard = "unnamedplus"

vim.o.number = true

require("plugins")
require("colours")

require("config.plugins")
