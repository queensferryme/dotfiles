local M = {}

M.map = function (k, v)
    vim.api.nvim_set_keymap('n', k, v, { noremap = true })
end

return M
