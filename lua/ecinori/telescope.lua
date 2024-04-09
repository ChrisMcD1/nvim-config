require('telescope').setup {
    defaults = {
        path_display = {
            shorten = { len = 1, exclude = { -1, -2, -3 } },
        }
    },
    pickers = {
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

