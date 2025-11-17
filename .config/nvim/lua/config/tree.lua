local function my_on_attach(bufnr)
    local api = require("nvim-tree.api")

    local function opts(desc)
        return {
            desc = "nvim-tree: " .. desc,
            buffer = bufnr,
            noremap = true,
            silent = true,
            nowait = true
        }
    end

    api.config.mappings.default_on_attach(bufnr)
end

require("nvim-tree").setup({
    on_attach = my_on_attach,
    sort = {
        sorter = "case_sensitive",
    },
    view = {
        width = 30,
    },
    renderer = {
        group_empty = true,
    },
    filters = {
        dotfiles = false,
        git_ignored = false
    },
})

vim.keymap.set("n", "<C-b>", "<cmd>NvimTreeFocus<cr>", {
    desc = "Focus nvim-tree",
    noremap = true,
    silent = true
})
