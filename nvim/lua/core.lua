vim.api.nvim_set_keymap('n', '<Leader>r', ':set relativenumber!<CR>', { noremap = true })

vim.cmd [[autocmd WinEnter * setlocal cursorline]]
vim.cmd [[autocmd WinLeave * setlocal nocursorline]]

vim.g.mapleader = ' '

vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.cursorline = true
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.listchars = 'eol:↲'
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.showmode = false
vim.opt.signcolumn = 'number'
vim.opt.softtabstop = 4
vim.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.updatetime = 100
vim.opt.writebackup = false
