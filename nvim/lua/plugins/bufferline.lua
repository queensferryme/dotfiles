function map(k, v)
    vim.api.nvim_set_keymap('n', k, v, { noremap = true })
end
-- Buffer Selection
map('<A-Left>',    ':BufferPrevious<CR>')
map('<A-Right>',   ':BufferNext<CR>')
map('<A-Up>',      ':BufferGoto 1<CR>')
map('<A-Down>',    ':BufferLast<CR>')
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
