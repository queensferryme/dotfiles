local M = {}

M.autosave = function()
    require("autosave").setup {
        enabled = true,
        execution_message = "",
        debounce_delay = 60000,
    }
end

M.comment = function()
    require("Comment").setup {
        ignore = "^%s*$",
    }
end

M.illuminate = function()
    vim.g.Illuminate_delay = 500
    vim.g.Illuminate_ftblacklist = { "alpha", "floaterm", "NvimTree", "packer", "qf" }
end

M.indent = function()
    vim.opt.colorcolumn = "99999"

    -- TODO: https://github.com/lukas-reineke/indent-blankline.nvim/issues/142
    require("indent_blankline").setup {
        buftype_exclude = { "help", "nofile", "terminal" },
    }
end

M.theme = function()
    vim.cmd [[autocmd TermEnter * setlocal winhighlight=Normal:NormalSB]]

    require("github-theme").setup {
        theme_style = "light",
        hide_inactive_statusline = false,
        sidebars = { "packer", "terminal" },
        dark_sidebar = true,
        dark_float = true,
    }
end

return M
