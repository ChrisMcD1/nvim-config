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

    'folke/tokyonight.nvim',
    'terrortylor/nvim-comment',
    {
        'kdheepak/lazygit.nvim',
        event = "VeryLazy",
        dependencies = {
            'nvim-lua/plenary.nvim'
        }
    },

    {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    },

    'neovim/nvim-lspconfig',

    {
        'hrsh7th/nvim-cmp',
        dependencies = {
            { "hrsh7th/cmp-nvim-lsp" },
            { "hrsh7th/cmp-vsnip" },
            { "hrsh7th/vim-vsnip" },
        }
    },

    {
        'scalameta/nvim-metals',
        dependencies = {
            { 'nvim-lua/plenary.nvim' },
            { 'mfussenegger/nvim-dap' },
        }
    },

    {
        'nvim-treesitter/nvim-treesitter',
        build = ":TSUpdate"
        -- function()
        --     require('nvim-treesitter.install').update({ with_sync = true })()
        -- end,
    },

    {
        "folke/trouble.nvim",
        dependencies = "kyazdani42/nvim-web-devicons"
    },

    {
        "kylechui/nvim-surround",
        version = "*",
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },

    {
        'nvim-telescope/telescope.nvim',
        tag = '0.1.4',
        dependencies = { { 'nvim-lua/plenary.nvim' } }
    },

})
