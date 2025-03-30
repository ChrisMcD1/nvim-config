return {
    'nvim-telescope/telescope.nvim',
    dependencies = {
        { 'nvim-lua/plenary.nvim' },
        {
            "nvim-telescope/telescope-live-grep-args.nvim",
            -- This will not install any breaking changes.
            -- For major updates, this must be adjusted manually.
            version = "^1.0.0",
        },
    },
    opts = {
        defaults = {
            layout_strategy = "vertical",
            layout_config = {
                preview_cutoff = 30
            }
        },
        pickers = {
            lsp_implementations = {
                fname_width = 100
            },
            lsp_references = {
                fname_width = 100
            },
            lsp_incoming_calls = {
                fname_width = 100
            },
            live_grep = {
                additional_args = function(opts)
                    return { '--hidden', '--iglob', '!.git' }
                end
            },
            find_files = {
                find_command = { 'rg', '--files', '--iglob', '!.git', '--hidden' }
            }
        }

    },
    config = function(_, opts)
        local telescope = require('telescope')
        telescope.setup(opts)
        local builtin = require('telescope.builtin')
        telescope.load_extension("live_grep_args")
        vim.keymap.set("n", "<leader>ff", builtin.find_files)
        vim.keymap.set("n", "<leader>fg", telescope.extensions.live_grep_args.live_grep_args)
        vim.keymap.set("n", "<leader>fr", builtin.resume)
        vim.keymap.set("n", "<leader>fb", builtin.buffers)
        vim.keymap.set("n", "<leader>fh", builtin.help_tags)
        vim.keymap.set("n", "<leader>fs", builtin.git_status)
        vim.keymap.set("n", "<leader>fc", builtin.git_bcommits)
        -- LSP type bindings
        vim.keymap.set("n", "gd", builtin.lsp_definitions)
        vim.keymap.set("n", "gt", builtin.lsp_type_definitions)
        vim.keymap.set("n", "gi", builtin.lsp_implementations)
        vim.keymap.set("n", "gr", builtin.lsp_references)
        vim.keymap.set("n", "gR", builtin.lsp_incoming_calls)
        vim.keymap.set("n", "gvd", function() builtin.lsp_definitions({ jump_type = "vsplit" }) end)
        vim.keymap.set("n", "gvt", function() builtin.lsp_type_definitions({ jump_type = "vsplit" }) end)
        vim.keymap.set("n", "gvi", function() builtin.lsp_implementations({ jump_type = "vsplit" }) end)
        vim.keymap.set("n", "gvr", function() builtin.lsp_references({ jump_type = "vsplit" }) end)
        -- Error reporting
        -- all workspace diagnostics
        vim.keymap.set("n", "<leader>aa", builtin.diagnostics)
        -- all workspace errors
        vim.keymap.set("n", "<leader>ae", function() builtin.diagnostics({ severity = "E" }) end)
        -- all workspace warnings
        vim.keymap.set("n", "<leader>aw", function() builtin.diagnostics({ severity = "W" }) end)
    end
}
