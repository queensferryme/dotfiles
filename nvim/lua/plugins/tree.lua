vim.api.nvim_set_keymap('n', '<C-n>', ':NvimTreeToggle<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('i', '<C-n>', '<C-O>:NvimTreeToggle<CR>', { noremap = true, silent = true })

vim.cmd [[autocmd CursorHold,CursorHoldI * :NvimTreeRefresh]]

vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_highlight_opened_files = 1
vim.g.nvim_tree_window_picker_exclude = {
    buftype = { 'terminal' },
    filetype = { 'packer' },
}

require('nvim-tree').setup {
    open_on_setup = true,
    hijack_cursor = true,
    update_cwd = true,
    diagnostics = { enable = true },
    filters = { dotfiles = true },
    view = {
        width = function ()
            local winwidth = vim.fn.winwidth(0)
            if winwidth <= 100 then
                return 30
            elseif winwidth <= 200 then
                return 45
            else
                return 60
            end
        end,
        hide_root_folder = true,
    },
}
