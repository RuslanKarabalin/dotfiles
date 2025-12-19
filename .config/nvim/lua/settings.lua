vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.linebreak = true

vim.opt.hlsearch = false
vim.opt.splitbelow = true
vim.opt.splitright = true

vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.softtabstop = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

vim.opt.background = 'dark'
vim.opt.termguicolors = true
vim.cmd.colorscheme('gruvbox-material')

vim.opt.colorcolumn = "80,120"
vim.cmd [[highlight ColorColumn ctermbg=lightgrey guibg=lightgrey]]
