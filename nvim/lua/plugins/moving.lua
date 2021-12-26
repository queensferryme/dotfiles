local M = {}

M.tabout = function()
    require("tabout").setup {
        tabkey = "",
        backwards_tabkey = "",
    }

    vim.cmd [[autocmd BufEnter * lua require("utils").mmap("i", "<Tab>", "v:lua.Tabout()", { expr = true })]]
    vim.cmd [[autocmd BufEnter * lua require("utils").mmap("i", "<S-Tab>", "v:lua.TaboutBack()", { expr = true })]]
end
_G.Tabout = function()
    local esc = require("utils").esc
    if vim.fn.pumvisible() ~= 0 then
        return esc "<C-n>"
    else
        return esc "<Plug>(Tabout)"
    end
end
_G.TaboutBack = function()
    local esc = require("utils").esc
    if vim.fn.pumvisible() ~= 0 then
        return esc "<C-p>"
    else
        return esc "<Plug>(TaboutBack)"
    end
end

M.hop = function()
    require("hop").setup {}

    local hop = function(action, direction, current_line_only, inclusive_jump)
        return "<Cmd>lua require('hop')."
            .. action
            .. "({ direction = "
            .. tostring(direction or "require('hop.hint').HintDirection." .. direction)
            .. ", current_line_only = "
            .. tostring(current_line_only)
            .. ", inclusive_jump = "
            .. tostring(inclusive_jump)
            .. " })<CR>"
    end
    local map = require("utils").map
    local mmap = require("utils").mmap
    map("f", hop("hint_char1", "AFTER_CURSOR", true, false))
    map("F", hop("hint_char1", "BEFORE_CURSOR", true, false))
    mmap("o", "f", hop("hint_char1", "AFTER_CURSOR", true, true))
    mmap("o", "F", hop("hint_char1", "BEFORE_CURSOR", true, true))
    mmap("", "t", hop("hint_char1", "AFTER_CURSOR", true, false))
    mmap("", "T", hop("hint_char1", "BEFORE_CURSOR", true, false))
    mmap("", "s", hop("hint_char1", nil, false, false))
    mmap("", "st", hop("hint_char2", nil, false, false))
    mmap("", "sl", hop("hint_lines_skip_whitespace", nil, false, false))
    mmap("", "sp", hop("hint_patterns", nil, false, false))
end

return M
