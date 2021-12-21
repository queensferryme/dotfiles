function setup_git_blame()
    vim.g.blamer_enabled = true
    vim.g.blamer_delay = 2000
    vim.g.blamer_relative_time = true
end

function setup_git_signs()
    local map = require('utils').map
    map('ggd', ':SignifyHunkDiff<CR>')
    map('ggj', '<Plug>(signify-next-hunk)')
    map('ggk', '<Plug>(signify-prev-hunk)')
    map('ggu', ':SignifyHunkUndo<CR>')

    vim.g.signify_sign_add = '+'
    vim.g.signify_sign_delete = '⨯'
    vim.g.signify_sign_delete_first_line = '⨯̄'
    vim.g.signify_sign_change = '±'
    vim.g.signify_sign_change_delete = '⨱'
end

function setup_lazygit()
    vim.api.nvim_set_keymap('n', '<Leader>gg', ':LazyGit<CR>', {})

    vim.g.lazygit_floating_window_winblend = 0
end

local M = {}
M.git_blame = setup_git_blame
M.git_signs = setup_git_signs
M.lazygit = setup_lazygit
return M
