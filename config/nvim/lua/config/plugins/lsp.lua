local lspconfig = require("lspconfig")

local on_attach = function(client, buffer)
  vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")

  local function buf_set_keymap(...)
    vim.api.nvim_buf_set_keymap(buffer, ...)
  end

  buf_set_keymap(
    "n",
    "<Leader>cr",
    "<Cmd>lua vim.lsp.buf.rename()<CR>",
    { noremap = true, silent = true }
  )

  buf_set_keymap(
    "n",
    "<Leader>ca",
    '<Cmd>lua require("fzf-lua").lsp_code_actions()<CR>',
    { noremap = true, silent = true }
  )

  buf_set_keymap(
    "v",
    "<Leader>ca",
    '<Cmd>lua require("fzf-lua").lsp_code_actions()<CR>',
    { noremap = true, silent = true }
  )

  buf_set_keymap(
    "n",
    "<Leader>cj",
    '<Cmd>lua require("fzf-lua").lsp_live_workspace_symbols()<CR>',
    { noremap = true, silent = true }
  )
end

for _, server in ipairs({ "clojure_lsp", "tsserver" }) do
  lspconfig[server].setup({
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
  })
end

lspconfig["denols"].setup({
  autostart = false,
  on_attach = on_attach,
  flags = { debounce_text_changes = 150 },
})
