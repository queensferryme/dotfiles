call plug#begin('~/.vim/plugged')
    Plug 'elzr/vim-json'
    Plug 'kristijanhusak/defx-icons'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'rakr/vim-one'
    Plug 'Shougo/defx.nvim', { 'do': ':UpdateRemotePlugins' }
    Plug 'vim-airline/vim-airline'
    Plug 'voldikss/vim-floaterm'
    Plug 'wakatime/vim-wakatime'
    Plug 'Yggdroot/indentLine'
call plug#end()

"" buffers
inoremap <C-t>   <Esc>:bn<CR>i
inoremap <C-w>   <Esc>:bp\|bd#<CR>i
nnoremap <C-t>   :bn<CR>
nnoremap <C-w>   :bp\|bd#<CR>

"" elzr/vim-json
let g:vim_json_syntax_conceal=0

"" kristijanhusak/defx-icons
let g:defx_icons_enable_syntax_highlight=0

"" indent
set autoindent
set expandtab
set shiftwidth=4 softtabstop=4 tabstop=4
autocmd FileType yaml setlocal shiftwidth=2 softtabstop=2 tabstop=2

"" miscellany
set backspace=indent,eol,start
set mouse=a
set number
set scrolloff=3
set showmatch
set wrap!

"" rakr/vim-one
colorscheme one
set background=light
highlight Normal ctermbg=NONE guibg=NONE

"" search
set hlsearch
set ignorecase
set incsearch
set smartcase

"" Shougo/defx.nvim'
autocmd FileType defx call DefxSetup()
let g:python3_host_prog='/usr/bin/python3'
inoremap <C-n> <Esc>:execute ':Defx -winwidth=' . DefxWinwidth()<CR>
nnoremap <C-n> :execute ':Defx -winwidth=' . DefxWinwidth()<CR>
call defx#custom#option('_', {
    \ 'columns': 'space:indent:icons:filename:type',
    \ 'resume': 1,
    \ 'root_marker': '≡ ',
    \ 'sort': 'extension:filename',
    \ 'split': 'vertical',
    \ 'toggle': 1,
    \ })
function! DefxSetup() abort
    setlocal nonumber
    nnoremap <silent><buffer><expr> <CR>
        \ defx#is_directory() ?
        \ defx#do_action('open_tree', 'toggle') :
        \ defx#do_action('drop')
    nnoremap <silent><buffer><expr> .
        \ defx#do_action('toggle_ignored_files')
    nnoremap <silent><buffer><expr> ..
        \ defx#do_action('open_directory', '..')
    nnoremap <silent><buffer><expr> cd
        \ defx#do_action('open_directory')
    nnoremap <silent><buffer><expr> rm
        \ defx#do_action('remove')
    nnoremap <silent><buffer><expr> rn
        \ defx#do_action('rename')
endfunction
function! DefxWinwidth() abort
    let winwidth = winwidth(0)
    let ratio = winwidth > 120 ? 5 : 4
    return printf("%s", winwidth / ratio)
endfunction

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
let g:airline_section_x=airline#section#create_right(['floaterm', 'filetype'])
let g:airline_section_z='%l:%c %p%%'
let g:airline_theme='one'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#fnamemod=':t'

"" voldikss/vim-floaterm
autocmd TermOpen * setlocal nonumber
autocmd TermOpen * nnoremap <buffer><LeftRelease> <LeftRelease>i
let g:floaterm_autoclose=1
let g:floaterm_height=0.3
let g:floaterm_keymap_new='<F7>'
let g:floaterm_keymap_next='<F8>'
let g:floaterm_keymap_toggle='<F10>'
let g:floaterm_wintype='split'
function! FloatermInfo() abort
    let buffers = floaterm#buflist#gather()
    let cnt = len(buffers)
    let cur = floaterm#buflist#curr()
    let idx = index(buffers, cur) + 1
    return cnt ==? 0 ? '' : printf('term[%s/%s]', idx, cnt)
endfunction

"" Yggdroot/indentLine
let g:indentLine_fileTypeExclude=['defx', 'help']
autocmd TermOpen * IndentLinesDisable

