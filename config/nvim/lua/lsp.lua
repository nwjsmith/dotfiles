-- Use LSP
-- TODO do I need to unmap conjure's K when clojure LSP is activated?
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

  local capabilities = client.resolved_capabilities

  if capabilities.completion then
    completion.on_attach(client, bufnr)
  end

  if capabilities.find_references then
    telemap("fr", "lsp_references")
  end

  if capabilities.workspace_symbol then
    telemap("fs", "lsp_workspace_symbols")
  end

  if capabilities.code_actions then
    telemap("aa", "lsp_code_actions")
    vim.api.nvim_buf_set_keymap(
      bufnr,
      "v",
      "<Leader>ca",
      [[<Cmd>lua require("telescope.builtin").lsp_range_code_actions()<CR>]],
      { noremap = true, silent = true }
    )
  end

  if capabilities.declaration then
    bufmap("gd", "<Cmd>lua vim.lsp.buf.declaration()<CR>")
  end

  if capabilities.goto_definition then
    bufmap("gD", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  end

  if capabilities.hover then
    bufmap("K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  end

  if capabilities.rename then
    bufmap("<Leader>cr", "<Cmd>lua vim.lsp.buf.rename()<CR>")
  end

  if capabilities.signature_help then
    bufmap("<C-k>", "<Cmd>lua vim.lsp.buf.signature_help()<CR>")
  end

  if capabilities.document_formatting then
    bufmap("<Leader>f", "<Cmd>lua vim.lsp.buf.formatting()<CR>", opts)
  end

  bufmap("[d", "<Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  bufmap("]d", "<Cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  bufmap("<Leader>d", "<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")

  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

local servers = { "clojure_lsp", "rust_analyzer", "solargraph", "sorbet", "tsserver" }
for _, server in ipairs(servers) do
  lspconfig[server].setup { on_attach = on_attach }
end
