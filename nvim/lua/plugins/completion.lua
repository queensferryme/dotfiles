vim.cmd [[autocmd VimEnter * highlight link CocRustTypeHint Comment]]
vim.cmd [[autocmd VimEnter * highlight link CocRustChainingHint Comment]]

vim.g.coc_global_extensions = {
    'coc-go',
    'coc-pairs',
    'coc-pyright',
    'coc-rust-analyzer',
    'coc-tsserver',
}
