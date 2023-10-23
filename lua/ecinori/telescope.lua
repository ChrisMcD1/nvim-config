require('telescope').setup {
    pickers = {
        live_grep = {
            additional_args = function(opts)
                return {'--hidden', '--iglob', '!.git'}
            end
        },
        find_files = {
            find_command = {'rg', '--files', '--iglob', '!.git', '--hidden' }
        }
    }
}

