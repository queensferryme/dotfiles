local M = {}

M.tree = {}
M.tree.config = function()
    vim.cmd [[autocmd CursorHold,CursorHoldI * :NvimTreeRefresh]]

    vim.g.nvim_tree_group_empty = 1
    vim.g.nvim_tree_highlight_opened_files = 1
    vim.g.nvim_tree_respect_buf_cwd = 1
    vim.g.nvim_tree_window_picker_exclude = {
        buftype = { "terminal" },
        filetype = { "packer" },
    }

    require("nvim-tree").setup {
        disable_netrw = true,
        hijack_netrw = true,
        hijack_cursor = true,
        update_cwd = true,
        diagnostics = {
            enable = true,
        },
        update_focused_file = {
            enable = true,
            update_cwd = true,
            ignore_list = { "help" },
        },
        filters = {
            dotfiles = true,
        },
        view = {
            width = function()
                local columns = vim.go.columns
                if columns <= 100 then
                    return 30
                elseif columns <= 200 then
                    return 45
                else
                    return 50
                end
            end,
            hide_root_folder = true,
        },
    }
end
M.tree.setup = function()
    local map = require("utils").map
    map("<C-n>", "<Cmd>NvimTreeToggle<CR>")
end

return M
