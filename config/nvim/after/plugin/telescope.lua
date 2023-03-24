local builtin = require('telescope.builtin')
vim.keymap.set('n', '<Leader><Space>', builtin.git_files, {})
vim.keymap.set('n', '<Leader>ff', builtin.find_files, {})
vim.keymap.set('n', '<Leader>/', builtin.live_grep, {})
