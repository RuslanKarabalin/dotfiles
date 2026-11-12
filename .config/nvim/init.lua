vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_better_performance = 1

vim.wo.number = true
vim.wo.linebreak = true
vim.wo.signcolumn = "yes"
vim.wo.relativenumber = true

vim.opt.mouse = ""

vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.ignorecase = true

vim.opt.inccommand = "split"

vim.opt.cursorline = true

vim.opt.completeopt = { "menu", "menuone", "noselect" }

vim.opt.hlsearch = false
vim.opt.colorcolumn = "80,120"

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

vim.pack.add({
    { src = 'https://github.com/sainnhe/gruvbox-material' },
})

vim.cmd.colorscheme('gruvbox-material')
vim.cmd.highlight("ColorColumn", "ctermbg=lightgrey", "guibg=lightgrey")

vim.keymap.set("n", "<C-h>", "<C-w>h", { desc = "Move to left window" })
vim.keymap.set("n", "<C-j>", "<C-w>j", { desc = "Move to lower window" })
vim.keymap.set("n", "<C-k>", "<C-w>k", { desc = "Move to upper window" })
vim.keymap.set("n", "<C-l>", "<C-w>l", { desc = "Move to right window" })

vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.api.nvim_create_autocmd("TextYankPost", {
  callback = function()
    vim.highlight.on_yank({ timeout = 200 })
  end,
})
