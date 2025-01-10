return {
    'stevearc/oil.nvim',
    opts = {
        keymaps = {
            ["<C-h>"] = false,
            ["<C-l>"] = false,
        },
        view_options = {
            -- Show files and directories that start with "."
            show_hidden = true
        }
    },
    lazy = false,
    keys = {
        { "<leader>pv", "<cmd>Oil<cr>" }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
