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
    },
    ft = { "scala", "sbt", "java" },
    config = function()
        -- Lsp setup for metals (Scala)
        local metals_config = require("metals").bare_config()
        metals_config.settings = {
            showImplicitArguments = true,
            showImplicitConversionsAndClasses = true,
            showInferredType = true,
        }
        --
        metals_config.capabilities = require('blink.cmp').get_lsp_capabilities()
        metals_config.init_options.statusBarProvider = "off"
        --
        local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
        vim.api.nvim_create_autocmd("FileType", {
            pattern = { "scala", "sbt", "java" },
            callback = function()
                require("metals").initialize_or_attach(metals_config)
            end,
            group = nvim_metals_group,
        })
    end
}
