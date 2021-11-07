vim.api.nvim_set_keymap('n', '<C-n>', ':lua NvimTreeToggle()<CR>', { noremap = true })
vim.api.nvim_set_keymap('i', '<C-n>', '<C-O>:lua NvimTreeToggle()<CR>', { noremap = true })
function NvimTreeToggle()
    local bufferline = require('bufferline.state')
    local tree = require('nvim-tree')
    if require('nvim-tree.view').win_open() then
        bufferline.set_offset(0)
        tree.close()
    else
        bufferline.set_offset(NvimTreeWidth(), 'NvimTree')
        tree.open()
    end
end

vim.cmd [[autocmd CursorHold,CursorHoldI * :NvimTreeRefresh]]
-- TODO: https://github.com/kyazdani42/nvim-tree.lua/issues/770
vim.cmd [[autocmd VimResized * lua require('nvim-tree.view').View.width=NvimTreeWidth()]]
function NvimTreeWidth()
    local winwidth = vim.fn.winwidth(0)
    if winwidth <= 100 then
        return 30
    elseif winwidth <= 200 then
        return 40
    else
        return 50
    end
end

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
        width = NvimTreeWidth(),
        hide_root_folder = true,
    },
}

local tree ={}
tree.open = function ()
   require'bufferline.state'.set_offset(31, 'FileTree')
   require'nvim-tree'.find_file(true)
end

tree.close = function ()
   require'bufferline.state'.set_offset(0)
   require'nvim-tree'.close()
end

return {

}
