local options = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Files<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>/', ':Rg<CR>', options)
