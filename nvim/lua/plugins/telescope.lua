local M = {}

M.frecency = function()
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

M.project = function()
    require("project_nvim").setup {}
    require("telescope").load_extension "projects"
end

M.telescope = function()
    local map = require("utils").map
    map("<Leader>ff", "<Cmd>Telescope find_files<cr>")
    map("<Leader>fg", "<Cmd>Telescope live_grep<cr>")
    map("<Leader>fr", "<Cmd>Telescope frecency<cr>")
    map("<Leader>fp", "<Cmd>Telescope projects<cr>")

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

return M
