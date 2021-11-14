function setup_git_blame()
    vim.g.blamer_enabled = true
    vim.g.blamer_delay = 2000
    vim.g.blamer_relative_time = true
end

function setup_git_signs()
    vim.api.nvim_set_keymap('n', '<Leader>hd', ':SignifyHunkDiff<CR>', { noremap = true })
    vim.api.nvim_set_keymap('n', '<Leader>hj', '<Plug>(signify-next-hunk)', {})
    vim.api.nvim_set_keymap('n', '<Leader>hk', '<Plug>(signify-prev-hunk)', {})
    vim.api.nvim_set_keymap('n', '<Leader>hu', ':SignifyHunkUndo<CR>', { noremap = true })

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
