vim.cmd [[autocmd BufWinEnter,WinEnter * lua require("utils").cursorline(true)]]
vim.cmd [[autocmd WinLeave * lua require("utils").cursorline(false)]]
vim.cmd [[autocmd BufWritePost * lua require("utils").format()]]
vim.cmd [[autocmd BufEnter * lua require("utils").readonly()]]

local M = {}

M.cursorline = function(enable)
    if enable then
        local disabled_filetypes = { "alpha", "floaterm" }
        for _, filetype in ipairs(disabled_filetypes) do
            if vim.bo.filetype == filetype then
                return
            end
        end
        vim.wo.cursorline = true
    else
        vim.wo.cursorline = false
    end
end

M.format = vim.lsp.buf.formatting

M.map = function(k, v, opts)
    if opts == nil then
        opts = { noremap = true }
    end
    vim.api.nvim_set_keymap("n", k, v, opts)
end

M.readonly = function()
    local path = vim.fn.expand "%:p"
    local readonly = path:find "go/pkg" or path:find "rustup/toolchains" or path:find "python.*/site-packages"
    if readonly then
        vim.bo.modifiable = false
        vim.bo.readonly = true
    end
end

return M
