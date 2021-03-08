local sorters = require("telescope.sorters")

require("telescope").setup {
  file_sorter = sorters.get_fzy_sorter,
  generic_sorter = sorters.get_fzy_sorter
}

function telemap(mnemonic, builtin)
  vim.api.nvim_set_keymap(
    "n",
    "<Leader>" .. mnemonic,
    [[<Cmd>lua require("telescope.builtin").]] .. builtin .. [[()<CR>]],
    { noremap = true, silent = true }
  )
end

telemap("ff", "fd")
telemap("fb", "git_branches")
telemap("ft", "treesitter")
telemap("fr", "live_grep")
