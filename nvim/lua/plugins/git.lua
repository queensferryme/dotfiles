local M = {}

M.git_blame = function()
    vim.g.blamer_enabled = true
    vim.g.blamer_relative_time = true
    vim.g.blamer_show_in_visual_modes = false
end

M.git_signs = function()
    local map = require("utils").map
    map("ghd", "<Cmd>SignifyHunkDiff<CR>")
    map("ghj", "<plug>(signify-next-hunk)", {})
    map("ghk", "<plug>(signify-prev-hunk)", {})
    map("ghu", "<Cmd>SignifyHunkUndo<CR>")

    vim.g.signify_sign_add = "+"
    vim.g.signify_sign_delete = "⨯"
    vim.g.signify_sign_delete_first_line = "⨯̄"
    vim.g.signify_sign_change = "±"
    vim.g.signify_sign_change_delete = "⨱"
end

M.lazygit = function()
    local map = require("utils").map
    map("<Leader>gg", "<Cmd>LazyGit<CR>")

    vim.g.lazygit_floating_window_winblend = 0
end

return M
