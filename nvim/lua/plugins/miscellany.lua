local M = {}

M.autosave = function()
    require("autosave").setup {
        enabled = true,
        execution_message = "",
    }
end

return M
