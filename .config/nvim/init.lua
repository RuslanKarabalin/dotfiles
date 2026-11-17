vim.g.mapleader = " "
vim.g.maplocalleader = " "

local opt = vim.opt
local map = vim.keymap.set

opt.number = true
opt.relativenumber = true
opt.signcolumn = "yes"
opt.cursorline = true
opt.colorcolumn = "80,120"
opt.termguicolors = true
opt.background = "dark"
opt.winborder = "rounded"

opt.wrap = false
opt.scrolloff = 7
opt.sidescrolloff = 5
opt.splitbelow = true
opt.splitright = true
opt.splitkeep = "screen"
opt.mouse = ""

opt.ignorecase = true
opt.smartcase = true
opt.incsearch = true
opt.hlsearch = false
opt.inccommand = "split"

opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true

opt.virtualedit = "block"
opt.completeopt = { "menuone", "noselect", "popup" }
opt.clipboard = "unnamedplus"
opt.confirm = true

opt.undofile = true
opt.swapfile = false
opt.updatetime = 250
opt.shortmess:append("c")

vim.g.netrw_banner = 0
vim.g.netrw_liststyle = 3

vim.g.gruvbox_material_background = "medium"
vim.g.gruvbox_material_better_performance = 1

vim.pack.add({
    { src = "https://github.com/sainnhe/gruvbox-material" },
})

vim.cmd.colorscheme("gruvbox-material")
vim.api.nvim_set_hl(0, "ColorColumn", { bg = "#45403d" })

map("n", "<C-h>", "<C-w>h", { desc = "Window left" })
map("n", "<C-j>", "<C-w>j", { desc = "Window down" })
map("n", "<C-k>", "<C-w>k", { desc = "Window up" })
map("n", "<C-l>", "<C-w>l", { desc = "Window right" })

map("n", "n", "nzzzv")
map("n", "N", "Nzzzv")
map("n", "<C-d>", "<C-d>zz")
map("n", "<C-u>", "<C-u>zz")

map("x", "J", ":m '>+1<CR>gv=gv")
map("x", "K", ":m '<-2<CR>gv=gv")

map("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
map("n", "<leader>x", "<cmd>x<CR>", { desc = "Save file and exit" })
map("n", "<leader>e", "<cmd>Explore<CR>", { desc = "File explorer" })

local highlight_yank = vim.hl.hl_op or vim.hl.on_yank

vim.api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight yanked text",
    callback = function()
        highlight_yank({ higroup = "Visual", timeout = 150 })
    end,
})
