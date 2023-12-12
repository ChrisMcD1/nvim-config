local nnoremap = require("ecinori.keymap").nnoremap
local vnoremap = require("ecinori.keymap").vnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fr", "<cmd>Telescope resume<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

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
nnoremap("gd", vim.lsp.buf.definition)
nnoremap("gt",  vim.lsp.buf.type_definition)
nnoremap("gi", vim.lsp.buf.implementation)
nnoremap("gr", vim.lsp.buf.references)
nnoremap("gws", vim.lsp.buf.workspace_symbol)
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

-- all workspace diagnostics
map("n", "<leader>aa", vim.diagnostic.setqflist)

-- all workspace errors
map("n", "<leader>ae", function()
    vim.diagnostic.setqflist({ severity = "E" })
end)

-- all workspace warnings
map("n", "<leader>aw", function()
    vim.diagnostic.setqflist({ severity = "W" })
end)

-- buffer diagnostics only
map("n", "<leader>d", vim.diagnostic.setloclist)

map("n", "[c", function()
    vim.diagnostic.goto_prev({ wrap = false })
end)

map("n", "]c", function()
    vim.diagnostic.goto_next({ wrap = false })
end)
