local M = {}

M.trouble = {}
M.trouble.config = function()
    require("trouble").setup {
        use_diagnostic_signs = true,
    }
end
M.trouble.setup = function()
    local map = require("utils").map
    map("<Leader>xx", "<Cmd>TroubleToggle<CR>")
end

return M
