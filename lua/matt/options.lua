-- Options

vim.g.mapleader = " "
vim.g.maplocalleader = " "

vim.g.have_nerd_font = true

vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.tabstop = 4 -- how much space takes a tab
vim.opt.shiftwidth = 4 -- set how many spaces for a indent
vim.opt.expandtab = false -- converts tabs in spaces
vim.opt.smartindent = true
vim.opt.mouse = "a" -- enables mouse
vim.opt.clipboard = "unnamedplus" -- system clipboard
vim.opt.undofile = true -- save undo history
vim.opt.ignorecase = true -- case insensitive search
vim.opt.smartcase = true
vim.opt.signcolumn = "yes"
vim.opt.updatetime = 250
vim.opt.timeoutlen = 300 -- for keymapping time
vim.opt.splitright = true
vim.opt.splitbelow = true
vim.opt.inccommand = "split"
vim.opt.cursorline = true
vim.opt.scrolloff = 10
vim.opt.confirm = true -- confirm on non saved file
vim.opt.termguicolors = true
vim.opt.background = "dark" -- using dark mode

vim.opt.list = true
vim.opt.listchars = { tab = "  ", trail = "·", nbsp = "␣" } -- tab = '» '

vim.o.laststatus = 3 -- global status line
