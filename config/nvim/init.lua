vim.g.mapleader = " "

-- You are using Git, right?
vim.g.backup = false
vim.g.writebackup = false
vim.g.swapfile = false

vim.o.mouse = "a"

require("plugins")
require("colours")

require("config.plugins")
