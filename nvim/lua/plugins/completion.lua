function setup_autopair()
    require('nvim-autopairs').setup {}
end

function setup_coq()
    vim.cmd [[COQnow --shut-up]]
end

function setup_goto_preview()
    local map = require('utils').map
    map('gpd', ':lua require("goto-preview").goto_preview_definition()<CR>')
    map('gpi', ':lua require("goto-preview").goto_preview_implementation()<CR>')
    map('gpp', ':lua require("goto-preview").close_all_win()<CR>')
    map('gpr', ':lua require("goto-preview").goto_preview_references()<CR>')
    require('goto-preview').setup {
        border = { '↖', '─', '╮', '│', '╯', '─', '╰', '│' },
        post_open_hook = function (bufnr, window)
            vim.bo.modifiable = false
            vim.wo.number = false
            vim.wo.relativenumber = false
        end,
    }
end

function setup_lsp()
    local coq = require('coq')
    local map = require('utils').map
    require('nvim-lsp-installer').on_server_ready(function (server)
        server:setup(coq.lsp_ensure_capabilities {
            on_attach = function (client, bufnr)
                map('ghh', ':Lspsaga hover_doc<CR>')
                map('grn', ':Lspsage rename<CR>')
            end,
            flags = {
                debounce_text_changes = 150,
            },
        })
    end)
end

function setup_lsp_signature()
    require('lsp_signature').setup {
        bind = true,
        handler_opts = {
            border = 'rounded',
        },
    }
end

function setup_lspsaga()
    require('lspsaga').setup {
        border_style = 'round',
    }
end

local M = {}
M.autopair = setup_autopair
M.coq = setup_coq
M.goto_preview = setup_goto_preview
M.lsp = setup_lsp
M.lspsaga = setup_lspsaga
M.lsp_signature = setup_lsp_signature
return M
