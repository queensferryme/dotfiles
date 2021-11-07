function setup_git_blame()
    vim.g.blamer_enabled = true
    vim.g.blamer_relative_time = true
end

function setup_git_signs()
    vim.g.signify_sign_add = '+'
    vim.g.signify_sign_delete = '⨯'
    vim.g.signify_sign_delete_first_line = '⨯̄'
    vim.g.signify_sign_change = '±'
    vim.g.signify_sign_change_delete = '⨱'
end

local M = {}
M.git_blame = setup_git_blame
M.git_signs = setup_git_signs
return M
