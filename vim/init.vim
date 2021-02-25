call plug#begin('~/.vim/plugged')
    Plug 'elzr/vim-json'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'rakr/vim-one'
    Plug 'vim-airline/vim-airline'
    Plug 'voldikss/vim-floaterm'
    Plug 'wakatime/vim-wakatime'
    Plug 'Yggdroot/indentLine'
call plug#end()

"" elzr/vim-json
let g:vim_json_syntax_conceal=0

"" indent
set autoindent
set expandtab
set shiftwidth=4
set softtabstop=4
set tabstop=4

"" miscellany
set cursorline
set mouse=a
set number
set showmatch
set wrap!

"" netrw
let g:netrw_banner=0
let g:netrw_browse_split=0
let g:netrw_liststyle=3
let g:netrw_winsize=25
inoremap <C-n> <Esc>:25Lexplore<CR>
nnoremap <C-n> :25Lexplore<CR>

"" rakr/vim-one
colorscheme one
set background=light
highlight Normal ctermbg=NONE guibg=NONE

"" search
set ignorecase
set smartcase

"" shortcut
inoremap <C-S-t> <Esc>:bprevious<CR>i
inoremap <C-t>   <Esc>:bnext<CR>i
nnoremap <C-S-t> :bprevious<CR>
nnoremap <C-t>   :bnext<CR>

"" vim-airline/vim-airline
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
call airline#parts#define_function('floaterm', 'FloatermInfo')
let g:airline_section_y=airline#section#create_right(['floaterm','ffenc'])
let g:airline_section_z="%l:%c %p%%"
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

"" voldikss/vim-floaterm
autocmd TermOpen * setlocal nonumber nocursorline
autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
let g:floaterm_autoclose=1
let g:floaterm_height=0.3
let g:floaterm_keymap_new='<F7>'
let g:floaterm_keymap_next='<F8>'
let g:floaterm_keymap_prev='<F9>'
let g:floaterm_keymap_toggle='<F10>'
let g:floaterm_wintype='split'
function! FloatermInfo() abort
  let buffers = floaterm#buflist#gather()
  let cnt = len(buffers)
  let cur = floaterm#buflist#curr()
  let idx = index(buffers, cur) + 1
  return printf('term[%s/%s]', idx, cnt)
endfunction

"" Yggdroot/indentLine
let g:indentLine_fileTypeExclude=['help']

