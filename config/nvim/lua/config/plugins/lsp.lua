local lspconfig = require("lspconfig")

local on_attach = function(client, bufnr)
  vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
end

for _, server in ipairs({ "clojure_lsp", "tsserver" }) do
  lspconfig[server].setup({
    on_attach = on_attach,
    flags = { debounce_text_changes = 150 },
  })
end
