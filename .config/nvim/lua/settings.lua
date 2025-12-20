vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.linebreak = true
vim.wo.signcolumn = "yes"

vim.opt.hlsearch = false
vim.opt.colorcolumn = "80,120"
vim.cmd.highlight("ColorColumn", "ctermbg=lightgrey", "guibg=lightgrey")

vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.wrap = false
vim.opt.scrolloff = 7
vim.opt.virtualedit = "block"

vim.opt.formatoptions = "qrn1"

vim.opt.updatetime = 100
vim.opt.shortmess:append("c")

vim.opt.undofile = true
vim.opt.swapfile = false

vim.opt.shell = "/bin/zsh"
vim.opt.clipboard = "unnamedplus"

vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.cmd.colorscheme('gruvbox-material')

