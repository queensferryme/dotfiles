local M = {}

M.autosave = function()
    require("autosave").setup {
        enabled = true,
        execution_message = "",
        events = { "CursorHold" },
    }
end

return M
