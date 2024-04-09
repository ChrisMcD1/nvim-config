local nnoremap = require("ecinori.keymap").nnoremap
local vnoremap = require("ecinori.keymap").vnoremap

nnoremap("<leader>pv", "<cmd>Ex<CR>")

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fr", "<cmd>Telescope resume<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")
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
local builtin = require('telescope.builtin')
nnoremap("K", vim.lsp.buf.hover)
nnoremap("<leader>e", vim.diagnostic.open_float)
nnoremap("gd", builtin.lsp_definitions)
nnoremap("gt", builtin.lsp_type_definitions)
nnoremap("gi", builtin.lsp_implementations)
nnoremap("gr", builtin.lsp_references)

nnoremap("gvd", function() builtin.lsp_definitions({ jump_type = "vsplit" }) end)
nnoremap("gvt", function() builtin.lsp_type_definitions({ jump_type = "vsplit" }) end)
nnoremap("gvi", function() builtin.lsp_implementations({ jump_type = "vsplit" }) end)
nnoremap("gvr", function() builtin.lsp_references({ jump_type = "vsplit" }) end)

nnoremap("gws", builtin.lsp_workspace_symbols)
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

nnoremap("<leader>mn", "<cmd>MetalsNewScalaFile<cr>")

-- all workspace diagnostics
map("n", "<leader>aa", function()
    builtin.diagnostics()
end)

-- all workspace errors
map("n", "<leader>ae", function()
    builtin.diagnostics({ severity = "E" })
end)

-- all workspace warnings
map("n", "<leader>aw", function()
    builtin.diagnostics({ severity = "W" })
end)

-- buffer diagnostics only
map("n", "<leader>d", vim.diagnostic.setloclist)

map("n", "[c", function()
    vim.diagnostic.goto_prev({ wrap = false })
end)

map("n", "]c", function()
    vim.diagnostic.goto_next({ wrap = false })
end)
