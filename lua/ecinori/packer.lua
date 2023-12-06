-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
--vim.cmd [[packadd packer.nvim]]
--

local use = require('packer').use

require('packer').startup(function()
    -- Packer can manage itself
    use 'wbthomason/packer.nvim'

    use 'folke/tokyonight.nvim'
--    use 'JoosepAlviste/palenightfall.nvim'
    use 'terrortylor/nvim-comment'
    require('nvim_comment').setup()

    use 'kdheepak/lazygit.nvim'

    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }

    use 'neovim/nvim-lspconfig'

    use ({'hrsh7th/nvim-cmp',
        requires = {
            {"hrsh7th/cmp-nvim-lsp"},
            {"hrsh7th/cmp-vsnip"},
            {"hrsh7th/vim-vsnip"},
        }
    })

    use ({
        'scalameta/nvim-metals',
        requires = {
            {'nvim-lua/plenary.nvim'},
            {'mfussenegger/nvim-dap'},
        }
    })

    use {
        'nvim-treesitter/nvim-treesitter',
        run = function() require('nvim-treesitter.install').update({ with_sync = true }) end,
    }

    use {
        "folke/trouble.nvim",
        requires = "kyazdani42/nvim-web-devicons"
    }

    use {
        "kylechui/nvim-surround",
        tag = "*",
        config = function()
            require("nvim-surround").setup()
        end
    }

    use {
        'nvim-telescope/telescope.nvim', tag = '0.1.4',
        requires = { { 'nvim-lua/plenary.nvim' } }
    }

end)
