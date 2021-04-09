set termguicolors

lua << EOF
local colors = {
    green = vim.g.terminal_color_2,
    grey = "#DDDDDD",
    transparent = "transparent"
}

require"bufferline".setup{
    options = {
        modified_icon = "●"
    },
    highlights = {
        background = {
            guibg = colors.grey
        },
        buffer_selected = {
            guibg = colors.transparent,
            gui = "bold"
        },
        fill = {
            guibg = colors.grey
        },
        indicator_selected = {
            guibg = colors.transparent,
            guifg = colors.green
        }
    }
}
EOF

