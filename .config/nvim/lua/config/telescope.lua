require('telescope').setup({
    defaults = {
        hidden = true,
    },
    pickers = {
        find_files = {
            hidden = true,
            no_ignore = true,
            no_ignore_parent = true
        }
    }
})
