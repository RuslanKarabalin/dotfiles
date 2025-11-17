vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

vim.wo.number = true
vim.wo.relativenumber = true

vim.g.formatoptions = "qrn1"
vim.opt.showmode = false
vim.opt.updatetime = 100
vim.wo.signcolumn = "yes"
vim.opt.scrolloff = 3
vim.opt.wrap = false
vim.wo.linebreak = true
vim.opt.virtualedit = "block"
vim.opt.undofile = true
vim.opt.shell = "/bin/zsh"
vim.opt.swapfile = false

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.clipboard = "unnamedplus"

vim.opt.shortmess:append("c")

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.cmd.colorscheme('habamax')

vim.pack.add({
    { src = 'https://github.com/hrsh7th/nvim-cmp' },
    { src = 'https://github.com/L3MON4D3/LuaSnip' },
    { src = 'https://github.com/hrsh7th/cmp-nvim-lsp' },
    { src = 'https://github.com/neovim/nvim-lspconfig' },
    { src = 'https://github.com/nvim-tree/nvim-tree.lua' },
    { src = 'https://github.com/nvim-tree/nvim-web-devicons' },
    {
        src = 'https://github.com/nvim-treesitter/nvim-treesitter',
        branch = 'main'
    },
})
