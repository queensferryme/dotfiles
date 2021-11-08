function setup_autopair()
    require('nvim-autopairs').setup {
        map_cr = true,
    }
end

function setup_coc()
    vim.cmd [[autocmd VimEnter * highlight link CocRustTypeHint Comment]]
    vim.cmd [[autocmd VimEnter * highlight link CocRustChainingHint Comment]]

    vim.g.coc_global_extensions = {
        'coc-go',
        'coc-pyright',
        'coc-rust-analyzer',
        'coc-tsserver',
    }
end

local M = {}
M.autopair = setup_autopair
M.coc = setup_coc
return M
