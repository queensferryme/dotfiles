local M = {}

M.lsp_any = function (server, opts)
    local coq = require('coq')
    server:setup(coq.lsp_ensure_capabilities(opts))
end

M.lsp_rust_analyzer = function (server, opts)
    local coq = require('coq')
    require('rust-tools').setup {
        server = vim.tbl_deep_extend('force', server:get_default_options(), coq.lsp_ensure_capabilities(opts)),
        tools = {
            autoSetHints = true,
            inlay_hints = {
                show_parameter_hints = true,
                parameter_hints_prefix = ' ‣',
                other_hints_prefix = ' ‣',
            },
        },
    }
    server:attach_buffers()
end

M.rust = function ()
    vim.g.rustfmt_autosave = true
end

return M
