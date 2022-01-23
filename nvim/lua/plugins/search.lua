local M = {}

M.hlslens = function()
    local map = require("utils").map
    map("n", "<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>")
    map("N", "<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>")
    map("*", "*<Cmd>lua require('hlslens').start()<CR>")
    map("#", "#<Cmd>lua require('hlslens').start()<CR>")
    map("g*", "g*<Cmd>lua require('hlslens').start()<CR>")
    map("g#", "g#<Cmd>lua require('hlslens').start()<CR>")

    require("hlslens").setup {
        calm_down = true,
        nearest_only = true,
    }
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
    map("<Leader>fb", "<Cmd>Telescope current_buffer_fuzzy_find<CR>")
    map("<Leader>ff", "<Cmd>Telescope find_files<CR>")
    map("<Leader>fg", "<Cmd>Telescope live_grep<CR>")
    map("<Leader>fl", "<Cmd>Telescope resume<CR>")
    map("<Leader>fp", "<Cmd>Telescope projects<CR>")
    map("<Leader>fr", "<Cmd>Telescope frecency<CR>")
end

return M
