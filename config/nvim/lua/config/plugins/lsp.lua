local lspconfig = require("lspconfig")

local on_attach = function(client, buffer)
  vim.api.nvim_buf_set_option(buffer, "omnifunc", "v:lua.vim.lsp.omnifunc")

  function map(mode, lhs, rhs)
    options = { noremap = true, silent = true }
    vim.api.nvim_buf_set_keymap(buffer, mode, lhs, rhs, options)
  end

  map("n", "<Leader>cX", "<Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>")
  map("n", "<Leader>ca", "<Cmd>lua vim.lsp.buf.code_action()<CR>")
  map("n", "<Leader>cf", "<Cmd>lua vim.lsp.buf.formatting()<CR>")
  map("n", "<Leader>ci", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
  map("n", "<Leader>cr", "<Cmd>lua vim.lsp.buf.rename()<CR>")
  map("n", "K", "<Cmd>lua vim.lsp.buf.hover()<CR>")
  map("n", "[e", "<cmd>lua vim.lsp.diagnostic.goto_prev()<CR>")
  map("n", "]e", "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>")
  map("n", "gD", "<cmd>lua vim.lsp.buf.references()<CR>")
  map("n", "gI", "<Cmd>lua vim.lsp.buf.implementation()<CR>")
  map("n", "gd", "<Cmd>lua vim.lsp.buf.definition()<CR>")
  map("v", "<Leader>ca", ":<C-U>lua vim.lsp.buf.range_code_action()<CR>")
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
