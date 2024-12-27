return {
    'stevearc/oil.nvim',
    opts = {
        keymaps = {
            ["<C-h>"] = false,
            ["<C-l>"] = false,
        }
    },
    lazy = false,
    keys = {
        { "<leader>pv", "<cmd>Oil<cr>" }
    },
    dependencies = { "nvim-tree/nvim-web-devicons" },
}
