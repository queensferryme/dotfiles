vim.cmd [[autocmd WinEnter,BufWinEnter * lua EnableCurosrline()]]
vim.cmd [[autocmd WinLeave * setlocal nocursorline]]
function EnableCurosrline()
    if vim.bo.filetype == 'alpha' then
        return
    end
    vim.wo.cursorline = true
end

vim.g.mapleader = ' '

vim.opt.autoindent = true
vim.opt.backup = false
vim.opt.cursorline = true
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.hidden = true
vim.opt.ignorecase = true
vim.opt.listchars = 'eol:↲'
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.shortmess = vim.opt.shortmess + 'c'
vim.opt.showmode = false
vim.opt.signcolumn = 'number'
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.scrolloff = 3
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.updatetime = 100
vim.opt.wrap = false
vim.opt.writebackup = false
