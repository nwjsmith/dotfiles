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

-- Treesitter is the reason we're all here
require("nvim-treesitter.configs").setup {
  ensure_installed = "maintained",
  highlight = { enable = true },
}

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

-- Use LSP
local completion = require("completion")
local lspconfig = require("lspconfig")

function on_attach(client, bufnr)
  function bufmap(trigger, command)
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "n",
      trigger,
      command,
      { noremap = true, silent = true }
    )
  end

  function telemap(mnemonic, builtin)
    bufmap(
      "<Leader>" .. mnemonic,
      [[<Cmd>lua require("telescope.builtin").]] .. builtin .. "()<CR>"
    )
  end

  if client.resolved_capabilities.completion then
    completion.on_attach(client, bufnr)
  end

  if client.resolved_capabilities.find_references then
    telemap("fr", "lsp_references")
  end

  if client.resolved_capabilities.workspace_symbol then
    telemap("fs", "lsp_workspace_symbols")
  end

  if client.resolved_capabilities.code_actions and not vim.tbl_isempty(client.resolved_capabilities.code_actions.codeActionKinds) then
    telemap("ca", "lsp_code_actions")
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "v",
      "<Leader>ca",
      [[<Cmd>lua require("telescope.builtin").lsp_range_code_actions()<CR>]],
      { noremap = true, silent = true }
    )
  end

  if client.resolved_capabilities.declaration then
    bufmap("gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  end

  if client.resolved_capabilities.goto_definition then
    bufmap("gD", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  end

  if client.resolved_capabilities.hover then
    bufmap("K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  end
end

local servers = { "clojure_lsp", "rust_analyzer", "solargraph", "tsserver" }
for _, server in ipairs(servers) do
  lspconfig[server].setup { on_attach = on_attach }
end

require("local")
