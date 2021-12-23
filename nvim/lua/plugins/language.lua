vim.cmd [[autocmd FileType make,go setlocal noexpandtab]]

function get_server_opts(server, opts, custom_opts)
    return vim.tbl_deep_extend("force", server:get_default_options(), coq.lsp_ensure_capabilities(opts), custom_opts)
end

local M = {}

M.lsp_gopls = function(server, opts)
    local coq = require "coq"
    local root_pattern = require("lspconfig").util.root_pattern
    server:setup(get_server_opts(server, opts, {
        single_file_support = true,
        settings = {
            gopls = {
                ["ui.diagnostic.analyses"] = {
                    nilness = true,
                    unusedparams = true,
                    unusedwrite = true,
                },
            },
        },
    }))
end

M.lsp_pyright = function(server, opts)
    local coq = require "coq"
    server:setup(get_server_opts(server, opts, {}))
end

M.lsp_rust_analyzer = function(server, opts)
    local coq = require "coq"
    require("rust-tools").setup {
        server = get_server_opts(server, opts, {}),
        tools = {
            autoSetHints = true,
            inlay_hints = {
                show_parameter_hints = true,
                parameter_hints_prefix = " ‣",
                other_hints_prefix = " ‣",
            },
        },
    }
    server:attach_buffers()
end

return M
