function setup_autopair()
    require('nvim-autopairs').setup {}
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

    vim.opt.hidden = true
    vim.opt.shortmess:append('c')
end

local M = {}
M.autopair = setup_autopair
M.coc = setup_coc
return M
