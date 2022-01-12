local M = {}

M.autosave = function()
    require("autosave").setup {
        enabled = true,
        execution_message = "",
    }
end

M.comment = function()
    require("Comment").setup {
        ignore = "^%s*$",
    }
end

return M
