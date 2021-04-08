set termguicolors

lua << EOF
local bg = '#DDDDDD'

require"bufferline".setup{
    options = {
        modified_icon = "●",
    },
    highlights = {
        background = {
            guibg = bg
        },
        buffer_selected = {
            guibg = "transparent",
            gui = "bold"
        },
        fill = {
            guibg = bg
        },
        indicator_selected = {
            guifg = bg,
            guibg = bg
        }
    }
}
EOF

