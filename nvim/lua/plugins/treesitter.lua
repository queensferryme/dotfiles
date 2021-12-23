vim.opt.foldexpr = "nvim_treesitter#foldexpr()"
vim.opt.foldenable = false
vim.opt.foldmethod = "expr"

require("nvim-treesitter.configs").setup {
    ensure_installed = {
        "bash",
        "comment",
        "go",
        "gomod",
        "javascript",
        "lua",
        "python",
        "rust",
        "toml",
        "typescript",
        "yaml",
    },
    highlight = { enable = true },
    indent = { enable = true },
}
