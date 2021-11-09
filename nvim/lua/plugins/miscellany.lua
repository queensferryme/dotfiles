function setup_indent()
    vim.g.indent_blankline_filetype_exclude = { 'alpha', 'help', 'packer' }

    vim.opt.colorcolumn = "99999"

    -- TODO: https://github.com/lukas-reineke/indent-blankline.nvim/issues/142
    require('indent_blankline').setup {
        show_current_context = true,
    }
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
