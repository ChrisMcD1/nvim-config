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

cmap("W", "w");
