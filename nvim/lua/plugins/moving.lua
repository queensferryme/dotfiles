local M = {}

M.tabout = function()
    require("tabout").setup {
        tabkey = "",
        backwards_tabkey = "",
    }
end

M.hop = {}
M.hop.config = function()
    require("hop").setup {}
end
M.hop.setup = function()
    local hop = function(action, direction, current_line_only, inclusive_jump)
        return "<Cmd>lua require('hop')."
            .. action
            .. "({ direction = "
            .. tostring(direction and "require('hop.hint').HintDirection." .. direction)
            .. ", current_line_only = "
            .. tostring(current_line_only)
            .. ", inclusive_jump = "
            .. tostring(inclusive_jump)
            .. " })<CR>"
    end
    local map = require("utils").map
    local mmap = require("utils").mmap
    mmap("", "f", "<Cmd>HopChar1CurrentLineAC<CR>")
    mmap("", "F", "<Cmd>HopChar1CurrentLineBC<CR>")
    mmap("", "s", "<Cmd>HopChar1AC<CR>")
    mmap("", "S", "<Cmd>HopChar1BC<CR>")
    mmap("", "st", "<Cmd>HopChar2<CR>")
    mmap("", "sl", "<Cmd>HopLineStart<CR>")
    mmap("", "sp", "<Cmd>HopPattern<CR>")
end

return M
