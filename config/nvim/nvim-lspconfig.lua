local lspconfig = require("lspconfig")
local util = require("lspconfig/util")

local set_bindings = function(client, buffer)
  function bufmap(mode, lhs, fn)
    vim.keymap.set(mode, lhs, fn, { silent = true, buffer = buffer })
  end

  vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")

  bufmap("n", "<Leader>cX", vim.diagnostic.setqflist)
  bufmap("n", "<Leader>ca", vim.lsp.buf.code_action)
  bufmap("n", "<Leader>cf", vim.lsp.buf.formatting)
  bufmap("n", "<Leader>ci", vim.lsp.buf.implementation)
  bufmap("n", "<Leader>cr", vim.lsp.buf.rename)
  bufmap("n", "K", vim.lsp.buf.hover)
  bufmap("n", "[e", vim.diagnostic.goto_prev)
  bufmap("n", "]e", vim.diagnostic.goto_next)
  bufmap("n", "gD", vim.lsp.buf.references)
  bufmap("n", "gI", vim.lsp.buf.implementation)
  bufmap("n", "gd", vim.lsp.buf.definition)
  bufmap("v", "<Leader>ca", vim.lsp.buf.range_code_action)
end

function nixcmd(pkg)
  return { "nix", "run", "nixpkgs#" .. pkg, "--" }
end

local flags = { debounce_text_changes = 150 }

local servers = { rnix = "rnix-lsp", solargraph = "rubyPackages.solargraph" }
for server, package in pairs(servers) do
  lspconfig[server].setup({
    on_attach = set_bindings,
    cmd = nixcmd(package),
    flags = flags,
  })
end

local servers_without_formatting = { tsserver = "nodePackages.tsserver" }
for server, package in pairs(servers_without_formatting) do
  lspconfig[server].setup({
    on_attach = function(client, buffer)
      client.resolved_capabilities.document_formatting = false
      client.resolved_capabilities.document_range_formatting = false
      set_bindings(client, buffer)
    end,
    cmd = nixcmd(package),
    flags = flags,
  })
end
