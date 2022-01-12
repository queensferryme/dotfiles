local M = {}

M.floaterm = {}
M.floaterm.config = function()
    vim.cmd [[autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i]]
    vim.cmd [[autocmd TermOpen * setlocal nonumber norelativenumber]]

    vim.g.floaterm_autoclose = 1
    vim.g.floaterm_height = 0.3
    vim.g.floaterm_wintype = "split"
    vim.g.floaterm_opener = "tabe"
end
M.floaterm.setup = function()
    local map = require("utils").map
    map("<Leader>tn", "<Cmd>FloatermNew<CR>")
    map("<Leader>tk", "<Cmd>FloatermPrev<CR>")
    map("<Leader>tj", "<Cmd>FloatermNext<CR>")
    map("<Leader>tt", "<Cmd>FloatermToggle<CR>")

    local mmap = require("utils").mmap
    mmap("t", "<Leader>tn", [[<C-\><C-n><Cmd>FloatermNew<CR>]])
    mmap("t", "<Leader>tk", [[<C-\><C-n><Cmd>FloatermPrev<CR>]])
    mmap("t", "<Leader>tj", [[<C-\><C-n><Cmd>FloatermNext<CR>]])
    mmap("t", "<Leader>tt", [[<C-\><C-n><Cmd>FloatermToggle<CR>]])
end

return M
