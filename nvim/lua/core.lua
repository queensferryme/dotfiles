vim.cmd [[augroup cursorline
    autocmd!
    autocmd BufWinEnter,WinEnter * lua EnableCurosrline()
    autocmd WinLeave * setlocal nocursorline
augroup END]]
vim.cmd [[augroup search
    autocmd!
    autocmd InsertEnter * set nohlsearch
    autocmd InsertLeave * set hlsearch
augroup END]]
vim.cmd [[autocmd VimEnter * highlight CursorI guibg=black]]
function EnableCurosrline()
    local disabled_filetypes = { 'alpha', 'floaterm' }
    for _, filetype in ipairs(disabled_filetypes) do
        if vim.bo.filetype == filetype then
            return
        end
    end
    vim.wo.cursorline = true
end

vim.g.mapleader = ' '

vim.opt.autoindent = true
vim.opt.autoread = true
vim.opt.autowriteall = true
vim.opt.backup = false
vim.opt.cursorline = true
vim.opt.encoding = 'utf-8'
vim.opt.expandtab = true
vim.opt.guicursor = 'a:block,i:ver10-CursorI'
vim.opt.ignorecase = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.shiftwidth = 4
vim.opt.showmode = false
vim.opt.signcolumn = 'auto:3'
vim.opt.smartcase = true
vim.opt.softtabstop = 4
vim.opt.scrolloff = 3
vim.opt.tabstop = 4
vim.opt.termguicolors = true
vim.opt.timeoutlen = 300
vim.opt.updatetime = 100
vim.opt.wrap = false
vim.opt.writebackup = false

-- Languages
vim.cmd [[autocmd FileType go setlocal noexpandtab]]
