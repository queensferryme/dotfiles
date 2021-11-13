vim.api.nvim_set_keymap('n', 'gtr', ':FloatermNew --wintype=vsplit --position=rightbelow --width=0.25<CR>', { noremap = true })

vim.cmd [[autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i]]
vim.cmd [[autocmd TermOpen * setlocal nonumber]]

vim.g.floaterm_autoclose = true
vim.g.floaterm_height = 0.3
vim.g.floaterm_keymap_new = 'gtb'
vim.g.floaterm_keymap_prev = 'gtp'
vim.g.floaterm_keymap_next = 'gtn'
vim.g.floaterm_keymap_toggle = 'gtt'
vim.g.floaterm_opener = 'tabe'
vim.g.floaterm_wintype = 'split'
