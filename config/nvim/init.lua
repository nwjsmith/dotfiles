vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- You are using Git, right?
vim.g.backup = false
vim.g.writebackup = false
vim.g.swapfile = false

vim.o.mouse = "a"

vim.o.clipboard = "unnamedplus"

require("plugins")
require("colours")

require("config.plugins")
