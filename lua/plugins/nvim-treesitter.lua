return {
    'nvim-treesitter/nvim-treesitter',
    build = ":TSUpdate"
    -- function()
    --     require('nvim-treesitter.install').update({ with_sync = true })()
    -- end,
}
