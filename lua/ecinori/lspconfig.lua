local nnoremap = require("ecinori.keymap").nnoremap

local capabilities = require 'cmp_nvim_lsp'.default_capabilities()


local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

    local bufopts = { noremap = true, silent = true, buffer = bufnr }

    nnoremap('gD', vim.lsp.buf.declaration, bufopts)
    nnoremap('gd', vim.lsp.buf.definition, bufopts)
    nnoremap('gr', vim.lsp.buf.references, bufopts)
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
    flags = lsp_flags,
    capabilities = capabilities
})

require('lspconfig').tsserver.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
    cmd = {"typescript-language-server", "--stdio"}
})

require('lspconfig').tailwindcss.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    filetypes = {"typescript", "typescriptreact", "typescript.tsx"},
    cmd = {"tailwindcss-language-server", "--stdio"}
})

require('lspconfig').lua_ls.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

-- Lsp setup for metals (Scala)
local metals_config = require("metals").bare_config()
metals_config.settings = {
    showImplicitArguments = true,
}
--
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
--
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function()
      require("metals").initialize_or_attach({})
        -- basic remaps for nvim-metals
        nnoremap('gD', vim.lsp.buf.declaration)
        nnoremap('gd', vim.lsp.buf.definition)
        nnoremap('gr', vim.lsp.buf.references)
        nnoremap('gi', vim.lsp.buf.implementation)
        nnoremap('<leader>rn', vim.lsp.buf.rename)
        nnoremap('K', vim.lsp.buf.hover)
        nnoremap('<C-k>', vim.lsp.buf.signature_help)

    end,
    group = nvim_metals_group,
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]


local luasnip = require 'luasnip'

local cmp = require 'cmp'
cmp.setup {
    snippet = {
        expand = function(args)
            luasnip.lsp_expand(args.body)
        end
    },
    mapping = cmp.mapping.preset.insert({
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-Space>'] = cmp.mapping.complete(),
        ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
        },
--        ['<Tab>'] = cmp.mapping(function(fallback)
--            if cmp.visible() then
--                cmp.select_next_item()
--            elseif luasnip.expand_or_jumpable() then
--                luasnip.expand_or_jump()
--            else
--                fallback()
--            end
--        end, { 'i', 's' }),
--        ['<S-Tab>'] = cmp.mapping(function(fallback)
--            if cmp.visible() then
--                cmp.select_prev_item()
--            elseif luasnip.jumpable(-1) then
--                luasnip.jump(-1)
--            else
--                fallback()
--            end
--        end, { 'i', 's' }),
    }),
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }
    }
}
