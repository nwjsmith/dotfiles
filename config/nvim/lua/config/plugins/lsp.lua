local lspconfig = require("lspconfig")

local on_attach = function(client, buffer)
  vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")
  vim.api.nvim_buf_set_keymap(buffer, "n", "<Leader>cr", "<Cmd>lua vim.lsp.buf.rename()<CR>", { noremap = true, silent = true })
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
