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

return M
