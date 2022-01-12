local M = {}

M.illuminate = function()
    vim.g.Illuminate_delay = 500
    vim.g.Illuminate_ftblacklist = { "alpha", "floaterm", "NvimTree", "packer", "qf" }
end

M.indent = function()
    vim.g.indent_blankline_filetype_exclude = { "packer" }
    vim.opt.colorcolumn = "99999"

    require("indent_blankline").setup {
        buftype_exclude = { "help", "nofile", "terminal" },
    }
end

M.theme = function()
    require("github-theme").setup {
        theme_style = "light",
        sidebars = { "packer", "terminal" },
        dark_sidebar = true,
        dark_float = true,
    }
end

return M
