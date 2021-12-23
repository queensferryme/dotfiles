local M = {}

M.git_blame = function()
    vim.g.blamer_enabled = true
    vim.g.blamer_relative_time = true
    vim.g.blamer_show_in_visual_modes = false
end

M.git_signs = function()
    local map = require("utils").map
    map("ggd", "<Cmd>SignifyHunkDiff<CR>")
    map("ggj", "<Plug>(signify-next-hunk)")
    map("ggk", "<Plug>(signify-prev-hunk)")
    map("ggu", "<Cmd>SignifyHunkUndo<CR>")

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
