vim.cmd [[autocmd TermOpen * setlocal nonumber]]
vim.cmd [[autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i]]

vim.g.floaterm_autoclose = true
vim.g.floaterm_height = 0.3
vim.g.floaterm_keymap_new = "<F7>"
vim.g.floaterm_keymap_prev = "<F8>"
vim.g.floaterm_keymap_next = "<F9>"
vim.g.floaterm_keymap_toggle = "<F10>"
vim.g.floaterm_opener = 'tabe'
vim.g.floaterm_wintype = "split"
