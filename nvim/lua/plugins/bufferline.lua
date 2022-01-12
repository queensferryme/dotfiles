local M = {}

M.barbar = function()
    local map = require("utils").map
    -- Buffer Selection
    map("<A-Left>", "<Cmd>BufferPrevious<CR>")
    map("<A-Right>", "<Cmd>BufferNext<CR>")
    map("<A-Up>", "<Cmd>BufferGoto 1<CR>")
    map("<A-Down>", "<Cmd>BufferLast<CR>")
    -- Buffer Manipulation
    -- TODO: https://github.com/romgrk/barbar.nvim/issues/202
    map("<C-S-Left>", "<Cmd>BufferMovePrevious<CR>")
    map("<C-S-Right>", "<Cmd>BufferMoveNext<CR>")
    map("<C-S-Up>", "<Cmd>BufferPin<CR>")
    map("<C-S-Down>", "<Cmd>BufferClose<CR>")

    vim.g.bufferline = {
        animation = true,
        auto_hide = true,
        tabpages = true,
        closable = true,
        clickable = true,
        exclude_ft = { "qf" },
        exclude_name = {},
        icons = true,
        icon_custom_colors = false,
        icon_separator_active = "▍",
        icon_separator_inactive = "▍",
        icon_pinned = "",
        semantic_letters = true,
        no_name_title = "[No Name]",
    }
end

return M
