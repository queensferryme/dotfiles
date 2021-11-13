function setup_autosave()
    require('autosave').setup {
        enabled = true,
        execution_message = "",
    }
end

function setup_comment()
    require('Comment').setup {
        ignore = '^%s*$',
    }
end

function setup_indent()
    vim.g.indent_blankline_filetype_exclude = { 'alpha', 'help', 'packer' }

    vim.opt.colorcolumn = "99999"

    -- TODO: https://github.com/lukas-reineke/indent-blankline.nvim/issues/142
    require('indent_blankline').setup {
        buftype_exclude = { 'terminal' },
    }
end

function setup_theme()
    vim.cmd [[autocmd TermEnter * setlocal winhighlight=Normal:NormalSB]]

    require('github-theme').setup({
        theme_style = 'light',
        hide_inactive_statusline = false,
        sidebars = { 'packer', 'terminal' },
    })
end

local M = {}
M.autosave = setup_autosave
M.comment = setup_comment
M.indent = setup_indent
M.theme = setup_theme
return M
