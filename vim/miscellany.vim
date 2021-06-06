autocmd InsertEnter,InsertLeave * set cul!

set autowrite
set backspace=indent,eol,start
set encoding=utf-8
set ignorecase
set mouse=a
set scrolloff=3
set smartcase
set wrap!

autocmd TermOpen * setlocal nonumber
autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
let g:floaterm_autoclose = v:true
let g:floaterm_height = 0.3
let g:floaterm_keymap_new = "<F7>"
let g:floaterm_keymap_prev = "<F8>"
let g:floaterm_keymap_next = "<F9>"
let g:floaterm_keymap_toggle = "<F10>"
let g:floaterm_opener = "tabe"
let g:floaterm_wintype = "split"

