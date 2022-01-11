local M = {}

M.gitsigns = function()
    require("gitsigns").setup {
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
            ['o ih'] = ':<C-U>Gitsigns select_hunk<CR>',
            ['x ih'] = ':<C-U>Gitsigns select_hunk<CR>'
        },
        preview_config = {
            border = "rounded",
        },
    }
end

M.lazygit = {}
M.lazygit.config = function()
    vim.g.lazygit_floating_window_winblend = 0
end
M.lazygit.setup = function()
    local map = require("utils").map
    map("<Leader>gg", "<Cmd>LazyGit<CR>")
end

return M
