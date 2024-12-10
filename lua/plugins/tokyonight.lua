return {
    'folke/tokyonight.nvim',
    lazy = false,
    priority = 1000,
    version = "4.0.0",
    config = function()
        require("tokyonight").setup({
            style  = "moon",
            styles = {
                floats = "normal"
            },
            -- use_background = true
        })
        vim.g.tokyonight_transparent_sidebar = true
        vim.g.tokyonight_transparent = true
        vim.opt.background = 'dark'
        vim.opt.termguicolors = true

        vim.cmd('colorscheme tokyonight-moon')
    end
}
