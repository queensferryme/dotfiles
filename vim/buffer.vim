set termguicolors

lua << EOF
local bg = '#DDDDDD'

require"bufferline".setup{
    options = {
        modified_icon = "●"
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
            guibg = 'transparent',
            guifg = vim.g.terminal_color_2
        }
    }
}
EOF

