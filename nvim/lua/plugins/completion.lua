local M = {}

M.autopair = function()
    require("nvim-autopairs").setup {}
end

M.coq = function()
    vim.cmd [[COQnow --shut-up]]
end

M.lsp = function()
    local language = require "plugins.language"
    local map = require("utils").map
    local opts = {
        on_attach = function(client, bufnr)
            map("ghh", "<Cmd>Lspsaga hover_doc<CR>")
            map("grn", "<Cmd>Lspsaga rename<CR>")
            map("gpd", "<Cmd>lua require('telescope.builtin').lsp_definitions { jump_type = 'never' }<CR>")
            map("gpi", "<Cmd>lua require('telescope.builtin').lsp_implementations { jump_type = 'never' }<CR>")
            map("gpr", "<Cmd>Telescope lsp_references<CR>")
            map("gps", "<Cmd>Telescope lsp_document_symbols<CR>")
            require("illuminate").on_attach(client)
        end,
    }
    require("nvim-lsp-installer").on_server_ready(function(server)
        if server.name == "gopls" then
            language.lsp_gopls(server, opts)
        elseif server.name == "pyright" then
            language.lsp_pyright(server, opts)
        elseif server.name == "rust_analyzer" then
            language.lsp_rust_analyzer(server, opts)
        end
    end)
end

M.lspsaga = function()
    require("lspsaga").setup {
        border_style = "round",
    }
end

M.lsp_signature = function()
    require("lsp_signature").setup {
        bind = true,
        handler_opts = {
            border = "rounded",
        },
    }
end

return M
