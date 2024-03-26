local nnoremap = require("ecinori.keymap").nnoremap

local capabilities = require 'cmp_nvim_lsp'.default_capabilities()


local on_attach = function(client, bufnr)
    vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
end
--
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
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "typescript-language-server", "--stdio" }
})

require('lspconfig').tailwindcss.setup({
    on_attach = on_attach,
    flags = lsp_flags,
    capabilities = capabilities,
    filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
    cmd = { "tailwindcss-language-server", "--stdio" }
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
    showImplicitConversionsAndClasses = true,
    showInferredType = true,
}
--
metals_config.capabilities = require("cmp_nvim_lsp").default_capabilities()
--
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
    pattern = { "scala", "sbt", "java" },
    callback = function()
        require("metals").initialize_or_attach(metals_config)
    end,
    group = nvim_metals_group,
})

vim.cmd [[autocmd BufWritePre * lua vim.lsp.buf.format()]]

require("luasnip.loaders.from_vscode").lazy_load()

local has_words_before = function()
    unpack = unpack or table.unpack
    local line, col = unpack(vim.api.nvim_win_get_cursor(0))
    return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match("%s") == nil
end

-- completion related settings
-- This is similiar to what I use
local cmp = require("cmp")
local luasnip = require("luasnip")
cmp.setup({
    sources = {
        { name = "nvim_lsp" },
        { name = "luasnip" },
    },
    snippet = {
        expand = function(args)
            -- Comes from vsnip
            require('luasnip').lsp_expand(args.body)
        end,
    },
    preselect = cmp.PreselectMode.None,
    mapping = cmp.mapping.preset.insert({
        -- None of this made sense to me when first looking into this since there
        -- is no vim docs, but you can't have select = true here _unless_ you are
        -- also using the snippet stuff. So keep in mind that if you remove
        -- snippets you need to remove this select
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
        -- I use tabs... some say you should stick to ins-completion but this is just here as an example
        ["<Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_next_item()
                -- You could replace the expand_or_jumpable() calls with expand_or_locally_jumpable()
                -- that way you will only jump inside the snippet region
            elseif luasnip.expand_or_jumpable() then
                luasnip.expand_or_jump()
            elseif has_words_before() then
                cmp.complete()
            else
                fallback()
            end
        end, { "i", "s" }),

        ["<S-Tab>"] = cmp.mapping(function(fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, { "i", "s" }),
    }),
})
