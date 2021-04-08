let g:lightline = {}
let g:lightline.active = {
    \ 'left': [
    \     [ 'mode' ],
    \     [ 'filename' ] ],
    \ 'right': [
    \     [ 'lineinfo' ],
    \     [ 'fileformat', 'fileencoding', 'filetype' ] ],
    \ }
let g:lightline.colorscheme = 'one'
let g:lightline.component = {
    \ 'filename': '%t %{&readonly?"":""} %{&modified?"●":""}',
    \ 'fileencoding': '%{&fenc!=&enc?&fenc:""}',
    \ 'filetype': '%{&ft}',
    \ 'lineinfo': '%2l:%-2c',
	\ 'mode': ' %{lightline#mode()}',
    \ }
let g:lightline.component_visible_condition = {
    \ 'fileencoding': '&fenc!=&enc && &fenc!=#""',
    \ 'filetype': '&ft!=#""',
    \ }
let g:lightline.enable = {
    \ 'statusline': 1,
    \ 'tabline': 0,
    \ }
let g:lightline.separator = {
    \ 'left': '',
    \ 'right': '',
    \ }
 
