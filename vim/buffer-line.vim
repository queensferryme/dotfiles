set termguicolors

lua << EOF
require"bufferline".setup{
    options = {
        modified_icon = "●",
    }
}
EOF

