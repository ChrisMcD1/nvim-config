return {
    'scalameta/nvim-metals',
    version = "1.4.0",
    lazy = false,
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        { 'mfussenegger/nvim-dap' },
    },
    keys = {
        { "<leader>mn", "<cmd>MetalsNewScalaFile<cr>" },
        { "<leader>ml", "<cmd>MetalsToggleLogs<cr>" },
        { "<leader>mi", "<cmd>MetalsImportBuild<cr>" },
        { "<leader>mc", "<cmd>MetalsCompileClean<cr>" },
    }
}
