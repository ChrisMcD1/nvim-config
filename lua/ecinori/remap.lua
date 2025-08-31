local nnoremap = require("ecinori.keymap").nnoremap
local vnoremap = require("ecinori.keymap").vnoremap

nnoremap("<C-x>", ":cclose<cr>")
nnoremap("<leader>lg", "<cmd>LazyGit<cr>")

nnoremap("J", "mzJ`z")
nnoremap("<c-d>", "<c-d>zz")
nnoremap("<c-u>", "<c-u>zz")

vnoremap("J", ":m '>+1<CR>gv=gv")
vnoremap("K", ":m '<-2<CR>gv=gv")

--This unsets the "last search pattern" register by hitting return
nnoremap("<CR>", ":noh<CR><CR>")

-- LSP mappings
nnoremap("K", vim.lsp.buf.hover)
nnoremap("<leader>e", vim.diagnostic.open_float)

nnoremap("gws", vim.lsp.buf.workspace_symbol)
nnoremap("gwz", require("telescope.builtin").lsp_dynamic_workspace_symbols)

nnoremap("<leader>cl", vim.lsp.codelens.run)
nnoremap("<leader>sh", vim.lsp.buf.signature_help)
nnoremap("<leader>rn", vim.lsp.buf.rename)
nnoremap("<leader>fn", vim.lsp.buf.format)


-- Moving around quickfix list
nnoremap("<C-k>", "<cmd>cprev<CR>zz")
nnoremap("<C-j>", "<cmd>cnext<CR>zz")

-- DANGEROUS: This means that my gd remape will be VERY slow
-- since it has to wait to make suer I'm not trying to do a `gds`
-- nnoremap("gds", vim.lsp.buf.document_symbol)

local map = vim.keymap.set

map("n", "<leader>ws", function()
    require("metals").hover_worksheet()
end)

-- buffer diagnostics only
map("n", "<leader>d", vim.diagnostic.setloclist)

map("n", "[c", function()
    vim.diagnostic.goto_prev({ wrap = false })
end)

map("n", "]c", function()
    vim.diagnostic.goto_next({ wrap = false })
end)

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = "*",
    callback = function()
        vim.lsp.buf.format()
    end
})

vim.keymap.set({ 'n', 'v' }, '<leader>ly', function()
    local file_path = vim.fn.expand('%:p')
    local mode = vim.fn.mode()
    local formatted_text

    if mode == 'v' or mode == 'V' or mode == '\22' then -- visual mode
        -- Get visual selection range
        local start_line = vim.fn.line("'<")
        local end_line = vim.fn.line("'>")
        formatted_text = file_path .. '#L' .. start_line .. '-' .. end_line
    else -- normal mode
        local current_line = vim.fn.line('.')
        formatted_text = file_path .. '#L' .. current_line
    end

    -- Yank to system clipboard register
    vim.fn.setreg('*', formatted_text)

    -- Optional: print confirmation message
    print('Yanked: ' .. formatted_text)
end, { desc = 'Yank file path with line number(s) to system clipboard' })
