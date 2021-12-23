local map = require("utils").map
map("<Leader>tr", "<Cmd>FloatermNew --wintype=vsplit --position=rightbelow --width=0.25<CR>")

vim.cmd [[autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i]]
vim.cmd [[autocmd TermOpen * setlocal nonumber norelativenumber]]

vim.g.floaterm_autoclose = true
vim.g.floaterm_height = 0.3
vim.g.floaterm_keymap_new = "<Leader>tb"
vim.g.floaterm_keymap_prev = "<Leader>tp"
vim.g.floaterm_keymap_next = "<Leader>tn"
vim.g.floaterm_keymap_toggle = "<Leader>tt"
vim.g.floaterm_opener = "tabe"
vim.g.floaterm_wintype = "split"
