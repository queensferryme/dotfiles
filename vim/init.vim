call plug#begin('~/.vim/plugged')
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'rakr/vim-one'
    Plug 'vim-airline/vim-airline'
    Plug 'voldikss/vim-floaterm'
    Plug 'wakatime/vim-wakatime'
    Plug 'Yggdroot/indentLine'
call plug#end()

" Appearance
"" airline
let g:airline_mode_map = {
    \ '__'     : '-',
    \ 'c'      : 'C',
    \ 'i'      : 'I',
    \ 'ic'     : 'I',
    \ 'ix'     : 'I',
    \ 'n'      : 'N',
    \ 'multi'  : 'M',
    \ 'ni'     : 'N',
    \ 'no'     : 'N',
    \ 'R'      : 'R',
    \ 'Rv'     : 'R',
    \ 's'      : 'S',
    \ 'S'      : 'S',
    \ ''     : 'S',
    \ 't'      : 'T',
    \ 'v'      : 'V',
    \ 'V'      : 'V',
    \ ''     : 'V',
    \ }
let g:airline_section_z="%l:%c %p%%"
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'
"" colorscheme
colorscheme one
set background=light
highlight Normal ctermbg=NONE guibg=NONE

" Code Editing
"" buffer
inoremap <C-S-t> <Esc>:bprevious<CR>i
inoremap <C-t>   <Esc>:bnext<CR>i
nnoremap <C-S-t> :bprevious<CR>
nnoremap <C-t>   :bnext<CR>
"" indentation
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4
autocmd FileType cpp setlocal shiftwidth=2 softtabstop=2 tabstop=2

" Code Viewing
set cursorline
set ignorecase
set mouse=a
set number
set showmatch
set smartcase
set wrap!
"" indentLine
let g:indentLine_fileTypeExclude=['help']
"" netrw
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_liststyle=3
let g:netrw_winsize=25
inoremap <C-n> <Esc>:25Lexplore<CR>
nnoremap <C-n> :25Lexplore<CR>

" Terminal
execute 'highlight FloatermBorder ctermfg=23'
let g:floaterm_keymap_new='<F7>'
let g:floaterm_keymap_next='<F8>'
let g:floaterm_keymap_prev='<F9>'
let g:floaterm_keymap_toggle='<F10>'

