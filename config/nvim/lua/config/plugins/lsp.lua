local lspconfig = require("lspconfig")
local null_ls = require("null-ls")
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
  bufmap(buffer, "n", "[e", "<cmd>lua vim.diagnostic.goto_prev()<CR>")
  bufmap(buffer, "n", "]e", "<cmd>lua vim.diagnostic.goto_next()<CR>")
  bufmap(buffer, "n", "gD", "<cmd>lua vim.lsp.buf.references()<CR>")
  bufmap(buffer, "n", "gI", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
  bufmap(buffer, "n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  bufmap(buffer, "v", "<Leader>ca", ":<C-U>lua vim.lsp.buf.range_code_action()<CR>")
end

local flags = { debounce_text_changes = 150 }

lspconfig["clojure_lsp"].setup({
  on_attach = set_bindings,
  flags = flags,
})

lspconfig["denols"].setup({
  autostart = false,
  on_attach = set_bindings,
  root_dir = util.root_pattern("deno.json", "deno.jsonc", ".git"),
  flags = flags,
})

lspconfig["pylsp"].setup({
  on_attach = function(client, buffer)
    set_bindings(client, buffer)
  end,
  flags = flags,
})

lspconfig["tsserver"].setup({
  on_attach = function(client, buffer)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    set_bindings(client, buffer)
  end,
  flags = flags,
})

lspconfig["solargraph"].setup({
  on_attach = function(client, buffer)
    client.resolved_capabilities.document_formatting = false
    client.resolved_capabilities.document_range_formatting = false
    set_bindings(client, buffer)
  end,
  flags = flags,
})

null_ls.setup({
  sources = {
    null_ls.builtins.formatting.eslint_d,
    null_ls.builtins.formatting.rubocop,
    null_ls.builtins.diagnostics.eslint_d,
    null_ls.builtins.diagnostics.rubocop,
  },
  on_attach = set_bindings,
  debounce = 150,
})
