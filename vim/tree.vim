autocmd VimResized * lua require("nvim-tree.view").View.width=vim.fn.NvimTreeWidth()

function! NvimTreeWidth() abort
    let winwidth = winwidth(0)
    let ratio = winwidth > 120 ? 5 : 4
    return winwidth / ratio
endfunction

let g:nvim_tree_group_empty = 1
let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_special_files = []
let g:nvim_tree_width = NvimTreeWidth()
let g:nvim_tree_window_picker_exclude = {
    \ 'buftype': [ 'terminal' ]
    \ }

set termguicolors

lua <<EOF
require'nvim-tree'.setup {}
EOF

