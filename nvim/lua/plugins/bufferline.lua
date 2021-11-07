function map(k, v)
    vim.api.nvim_set_keymap('n', k, v, { noremap = true })
    vim.api.nvim_set_keymap('i', k, '<C-o>' .. v, { noremap = true })
end
-- Buffer Selection
map('<A-Left>',    ':BufferPrevious<CR>')
map('<A-Right>',   ':BufferNext<CR>')
map('<Leader>1',   ':BufferGoto 1<CR>')
map('<Leader>2',   ':BufferGoto 2<CR>')
map('<Leader>3',   ':BufferGoto 3<CR>')
map('<Leader>4',   ':BufferGoto 4<CR>')
map('<Leader>5',   ':BufferGoto 5<CR>')
map('<Leader>6',   ':BufferGoto 6<CR>')
map('<Leader>7',   ':BufferGoto 7<CR>')
map('<Leader>8',   ':BufferGoto 8<CR>')
map('<Leader>9',   ':BufferLast<CR>')
-- Buffer Manipulation
-- TODO: https://github.com/romgrk/barbar.nvim/issues/202
map('<Leader>w',   ':BufferClose<CR>')
map('<C-S-Left>',  ':BufferMovePrevious<CR>')
map('<C-S-Right>', ':BufferMoveNext<CR>')

vim.g.bufferline = {
    animation = true,
    auto_hide = true,
    tabpages = true,
    closable = true,
    clickable = true,
    exclude_ft = {},
    exclude_name = {},
    icons = true,
    icon_custom_colors = false,
    icon_separator_active = '▍',
    icon_separator_inactive = '▍',
    icon_pinned = '',
    semantic_letters = true,
    no_name_title = '[Untitled]',
}
