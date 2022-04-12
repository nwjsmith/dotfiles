vim.g.mapleader = ' '
vim.g.maplocalleader = ','

vim.g.backup = false
vim.g.writebackup = false
vim.g.swapfile = false

vim.o.mouse = 'a'

vim.o.clipboard = 'unnamedplus'

vim.opt.termguicolors = true
vim.g.gruvbox_italic = true
vim.g.background = 'light'
vim.cmd('colorscheme gruvbox')
require('lualine').setup({ theme = 'gruvbox_dark' })

local options = { noremap = true, silent = true }
vim.api.nvim_set_keymap('n', '<Leader>ff', ':Files<CR>', options)
vim.api.nvim_set_keymap('n', '<Leader>/', ':Rg<CR>', options)

require'gitsigns'.setup()

require'nvim-treesitter.configs'.setup {
  highlight = { enable = true },
  incremental_selection = { enable = true },
}

vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
vim.g["conjure#client#clojure#nrepl#eval#auto_require"] = false

local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

function bufmap(buffer, mode, lhs, rhs)
  options = { noremap = true, silent = true }
  vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, options)
end

local set_bindings = function(client, buffer)
  vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")

  bufmap(buffer, "n", "<Leader>cX", "<Cmd>lua vim.diagnostic.setqflist()<CR>")
  bufmap(buffer, "n", "<Leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
  bufmap(buffer, "n", "<Leader>cf", "<Cmd>lua vim.lsp.buf.formatting()<CR>")
  bufmap(buffer, "n", "<Leader>ci", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
  bufmap(buffer, "n", "<Leader>cr", "<Cmd>lua vim.lsp.buf.rename()<CR>")
  bufmap(buffer, "n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  bufmap(buffer, "n", "[e", "<Cmd>lua vim.diagnostic.goto_prev()<CR>")
  bufmap(buffer, "n", "]e", "<Cmd>lua vim.diagnostic.goto_next()<CR>")
  bufmap(buffer, "n", "gD", "<Cmd>lua vim.lsp.buf.references()<CR>")
  bufmap(buffer, "n", "gI", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
  bufmap(buffer, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  bufmap(buffer, "v", "<Leader>ca", ":<C-U>lua vim.lsp.buf.range_code_action()<CR>")
end

local flags = { debounce_text_changes = 150 }
for _, ls_with_formatting_disabled in pairs({ "tsserver" }) do
  lspconfig[ls_with_formatting_disabled].setup({
    on_attach = function(client, buffer)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      set_bindings(client, buffer)
    end,
    flags = flags,
  })
end
