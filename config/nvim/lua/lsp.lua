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
