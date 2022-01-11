vim.cmd [[autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i]]
vim.cmd [[autocmd TermOpen * setlocal nonumber norelativenumber]]

vim.g.floaterm_autoclose = 1
vim.g.floaterm_height = 0.3
vim.g.floaterm_keymap_new = "<Leader>tn"
vim.g.floaterm_keymap_prev = "<Leader>tk"
vim.g.floaterm_keymap_next = "<Leader>tj"
vim.g.floaterm_keymap_toggle = "<Leader>tt"
vim.g.floaterm_wintype = "split"
vim.g.floaterm_opener = "tabe"
