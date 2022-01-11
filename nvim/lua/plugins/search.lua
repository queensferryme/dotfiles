local M = {}

M.highlight_current_n = function()
    local map = require("utils").map
    map("n", "<Plug>(highlight-current-n-n)", {})
    map("N", "<Plug>(highlight-current-n-N)", {})
    map("*", "*N", {})

    vim.cmd [[augroup ClearSearchHL
        autocmd!
        autocmd CmdlineEnter /,\? set hlsearch
        autocmd CmdlineLeave /,\? set nohlsearch
        autocmd CmdlineLeave /,\? lua require("highlight_current_n")["/,?"]()
    augroup END]]
end

M.telescope = {}
M.telescope.config = function()
    require("telescope").setup {
        defaults = {
            layout_config = {
                scroll_speed = 2,
            },
        },
        pickers = {
            lsp_definitions = { theme = "dropdown" },
            lsp_implementations = { theme = "dropdown" },
            lsp_references = { theme = "dropdown" },
            lsp_document_symbols = { theme = "dropdown" },
        },
    }
end
M.telescope.frecency = function()
    local telescope = require "telescope"
    telescope.setup {
        extensions = {
            frecency = {
                show_unindexed = false,
            },
        },
    }
    telescope.load_extension "frecency"
end
M.telescope.projects = function()
    require("project_nvim").setup {}
    require("telescope").load_extension "projects"
end
M.telescope.setup = function()
    local map = require("utils").map
    map("<Leader>ff", "<Cmd>Telescope find_files<cr>")
    map("<Leader>fg", "<Cmd>Telescope live_grep<cr>")
    map("<Leader>fp", "<Cmd>Telescope projects<cr>")
    map("<Leader>fr", "<Cmd>Telescope frecency<cr>")
    map("<Leader>fs", "<Cmd>Telescope resume<cr>")
end

return M
