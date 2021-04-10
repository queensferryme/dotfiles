colorscheme onehalflight

set number

lua << EOF
require("nvim-treesitter.configs").setup {
  ensure_installed = {'python', 'rust'},
  highlight = {
    enable = true
  },
  indent = {
    enable = true
  }
}
EOF

