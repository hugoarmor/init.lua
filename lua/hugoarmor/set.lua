vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 2
vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.scrolloff = 8

vim.o.number = true
vim.o.numberwidth = 2
vim.o.signcolumn = "yes:2"

vim.opt.smartindent = true
vim.opt.updatetime = 4000

vim.opt.colorcolumn = ""

vim.opt.hlsearch = false
vim.opt.incsearch = true
vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.config/nvim/undodir"

vim.opt.termguicolors = true

vim.opt.clipboard = 'unnamedplus'

