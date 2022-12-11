local nnoremap = require("ecinori.keymap").nnoremap


local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    nnoremap('gD', vim.lsp.buf.declaration, bufopts)
    nnoremap('gd', vim.lsp.buf.definition, bufopts)
    nnoremap('gi', vim.lsp.buf.implementation, bufopts)
    nnoremap('<leader>rn', vim.lsp.buf.rename, bufopts)
    nnoremap('K', vim.lsp.buf.hover, bufopts)
    nnoremap('<C-k>', vim.lsp.buf.signature_help, bufopts)

end

local lsp_flags = {
    debounce_text_changes = 150,
}

require('lspconfig').rust_analyzer.setup({
    on_attach = on_attach,
    flags = lsp_flags
})

require('lspconfig').sumneko_lua.setup({
    on_attach = on_attach,
    flags = lsp_flags
})
