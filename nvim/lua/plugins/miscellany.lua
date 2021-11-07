function setup_indent()
    vim.g.indent_blankline_filetype_exclude = { 'alpha', 'help', 'packer' }
    vim.g.indent_blankline_show_end_of_line = true
end

function setup_theme()
    require('github-theme').setup({
        theme_style = 'light',
        sidebars = { 'packer', 'terminal' },
    })
end

local M = {}
M.indent = setup_indent
M.theme = setup_theme
return M
