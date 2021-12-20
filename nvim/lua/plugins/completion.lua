function setup_autopair()
    require('nvim-autopairs').setup {}
end

function setup_coq()
    vim.cmd [[COQnow --shut-up]]
end

function setup_lsp()
    local coq = require('coq')
    require("nvim-lsp-installer").on_server_ready(function(server)
        server:setup(coq.lsp_ensure_capabilities())
    end)
end

local M = {}
M.autopair = setup_autopair
M.coq = setup_coq
M.lsp = setup_lsp
return M
