return {
    'neovim/nvim-lspconfig',
    dependencies = { 'saghen/blink.cmp' },
    config = function()
        local capabilities = require('blink.cmp').get_lsp_capabilities()
        local lspconfig = require('lspconfig')
        -- local lsp_flags = {
        --     debounce_text_changes = 150,
        -- }
        lspconfig.rust_analyzer.setup({
            capabilities = capabilities
        })

        lspconfig.ts_lsp.setup({
            capabilities = capabilities,
            filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
            cmd = { "typescript-language-server", "--stdio" }
        })

        lspconfig.tailwindcss.setup({
            capabilities = capabilities,
            filetypes = { "typescript", "typescriptreact", "typescript.tsx" },
            cmd = { "tailwindcss-language-server", "--stdio" }
        })

        lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
                Lua = {
                    diagnostics = {
                        globals = { 'vim' }
                    }
                }
            }
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function()
                vim.lsp.buf.format()
            end
        })
    end
}
