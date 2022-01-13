local M = {}

M.diffview = {}
M.diffview.config = function()
    vim.opt.fillchars:append "diff:╱"

    require("diffview").setup {
        enhanced_diff_hl = true,
    }
end
M.diffview.setup = function()
    local map = require("utils").map
    map("<Leader>gd", "<Cmd>DiffviewOpen<CR>")
    map("<Leader>gg", "<Cmd>DiffviewClose<CR>")
    map("<Leader>gh", "<Cmd>DiffviewFileHistory<CR>")
end

M.gitsigns = function()
    vim.cmd [[autocmd BufEnter * highlight GitSignsCurrentLineBlame gui=italic]]

    require("gitsigns").setup {
        signs = {
            add = { text = "┃" },
            change = { text = "┃" },
            delete = { text = "┃" },
            topdelete = { text = "┃" },
            changedelete = { text = "┃" },
        },
        current_line_blame = true,
        current_line_blame_formatter_opts = {
            relative_time = true,
        },
        keymaps = {
            noremap = true,
            ["n ghd"] = "<Cmd>Gitsigns preview_hunk<CR>",
            ["n ghj"] = "<Cmd>Gitsigns next_hunk<CR>",
            ["n ghk"] = "<Cmd>Gitsigns prev_hunk<CR>",
            ["n ghr"] = "<Cmd>Gitsigns reset_hunk<CR>",
            ["v ghr"] = ":Gitsigns reset_hunk<CR>",
            ["n ghR"] = "<Cmd>Gitsigns reset_buffer<CR>",
            ["n ghs"] = "<Cmd>Gitsigns stage_hunk<CR>",
            ["v ghs"] = ":Gitsigns stage_hunk<CR>",
            ["n ghS"] = "<Cmd>Gitsigns stage_buffer<CR>",
            -- hunk text objects
            ["o ih"] = ":<C-U>Gitsigns select_hunk<CR>",
            ["x ih"] = ":<C-U>Gitsigns select_hunk<CR>",
        },
        preview_config = {
            border = "rounded",
        },
    }
end

return M
