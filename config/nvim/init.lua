vim.g.mapleader = " "

-- You are using Git, right?
vim.g.backup = false
vim.g.writebackup = false
vim.g.swapfile = false

require("plugins")
require("colours")

require("config.plugins")
