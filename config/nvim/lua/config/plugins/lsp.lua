local lspconfig = require("lspconfig")

local on_attach = function(client, buffer)
  vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")
  options = { noremap = true, silent = true }

  vim.api.nvim_buf_set_keymap(
    buffer,
    "n",
    "<Leader>cr",
    "<Cmd>lua vim.lsp.buf.rename()<CR>",
    options
  )

  vim.api.nvim_buf_set_keymap(
    buffer,
    "v",
    "<Leader>ca",
    ":<C-U>lua vim.lsp.buf.range_code_action()<CR>",
    options
  )

  vim.api.nvim_buf_set_keymap(
    buffer,
    "n",
    "K",
    "<Cmd>lua vim.lsp.buf.hover()<CR>",
    options
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
