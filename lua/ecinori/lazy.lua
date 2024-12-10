-- This file can be loaded by calling `lua require('plugins')` from your init.vim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable",
        lazypath
    })
end
vim.opt.rtp:prepend(lazypath)

-- Check if nvim-coment is working!

require('lazy').setup({
    { import = "plugins" },
    {
        'folke/tokyonight.nvim',
        version = "3.0.1"
    },
    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons"
    },
    'terrortylor/nvim-comment',
    'neovim/nvim-lspconfig',
})
