autocmd VimResized * lua require("nvim-tree.lib").Tree.win_width=vim.fn.NvimTreeWidth()

function! NvimTreeWidth() abort
    let winwidth = winwidth(0)
    let ratio = winwidth > 120 ? 5 : 4
    return winwidth / ratio
endfunction

let g:nvim_tree_hide_dotfiles = 1
let g:nvim_tree_indent_markers = 1
let g:nvim_tree_width = NvimTreeWidth()

set termguicolors

