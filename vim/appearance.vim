colorscheme onehalflight
highlight Normal ctermbg=None guibg=None
highlight LineNr ctermbg=None guibg=None

let g:signify_sign_add = "▍+"
let g:signify_sign_delete = "▍⨯"
let g:signify_sign_delete_first_line = "▍⨯̄"
let g:signify_sign_change = "▍±"
let g:signify_sign_change_delete = "▍⨱"

set number
set updatetime=100

lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = {'javascript', 'python', 'rust'},
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}
EOF

