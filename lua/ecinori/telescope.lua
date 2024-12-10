local telescope = require('telescope')
telescope.setup {
    defaults = {
        layout_strategy = "vertical",
    },
    pickers = {
        lsp_implementations = {
            fname_width = 120
        },
        lsp_references = {
            fname_width = 120
        },
        lsp_incoming_calls = {
            fname_width = 120
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
}

telescope.load_extension("live_grep_args")
