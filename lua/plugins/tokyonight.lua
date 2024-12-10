return {
    'folke/tokyonight.nvim',
    version = "3.0.0",
    config = function()
        vim.g.tokyonight_transparent_sidebar = true
        vim.g.tokyonight_transparent = true
        vim.opt.background = 'dark'
        vim.opt.termguicolors = true

        vim.cmd('colorscheme tokyonight')
    end
}
