vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.incsearch = true
vim.opt.signcolumn = 'yes'
vim.opt.nrformats:append('unsigned')

vim.opt.smartindent = true

vim.opt.wrap = false

vim.g.mapleader = " "

vim.opt.scrolloff = 6

vim.opt.background = "dark"
vim.opt.shortmess:append({ I = true })

if vim.fn.executable('nvr') == 1 then
    vim.env.GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
end
