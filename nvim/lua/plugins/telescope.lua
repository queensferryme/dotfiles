local map = require("utils").map
map("<Leader>ff", "<Cmd>Telescope find_files<cr>")
map("<Leader>fg", "<Cmd>Telescope live_grep<cr>")

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
