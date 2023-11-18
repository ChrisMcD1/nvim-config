local nnoremap = require("ecinori.keymap").nnoremap
local cnoremap = require("ecinori.keymap").cnoremap
local cmap = require("ecinori.keymap").cmap

nnoremap("<leader>pv", "<cmd>Ex<CR>")

nnoremap("<leader>ff", "<cmd>Telescope find_files<cr>")
nnoremap("<leader>fg", "<cmd>Telescope live_grep<cr>")
nnoremap("<leader>fb", "<cmd>Telescope buffers<cr>")
nnoremap("<leader>fh", "<cmd>Telescope help_tags<cr>")

nnoremap("<leader>lg", "<cmd>LazyGit<cr>")

nnoremap("<c-d>", "<c-d>zz")
nnoremap("<c-u>", "<c-u>zz")
nnoremap("<C-J>", "<C-W><C-J>")
nnoremap("<C-K>", "<C-W><C-K>")
nnoremap("<C-L>", "<C-W><C-L>")
nnoremap("<C-H>", "<C-W><C-H>")

nnoremap("<C-H>", "<C-W><C-H>")

--This unsets the "last search pattern" register by hitting return
nnoremap("<CR>", ":noh<CR><CR>")



-- LSP mappings
nnoremap("gd",  vim.lsp.buf.definition)
nnoremap("K",  vim.lsp.buf.hover)
nnoremap("gi", vim.lsp.buf.implementation)
nnoremap("gr", vim.lsp.buf.references)
nnoremap("gws", vim.lsp.buf.workspace_symbol)
nnoremap("<leader>cl", vim.lsp.codelens.run)
nnoremap("<leader>sh", vim.lsp.buf.signature_help)
nnoremap("<leader>rn", vim.lsp.buf.rename)
nnoremap("<leader>fn", vim.lsp.buf.format)
nnoremap("<leader>ca", vim.lsp.buf.code_action)


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
