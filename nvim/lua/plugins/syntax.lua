local M = {}

M.comment = function()
    require("Comment").setup {
        ignore = "^%s*$",
    }
end

M.treesitter = {}
M.treesitter.config = function()
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
end
M.treesitter.textobjects = function()
    require("nvim-treesitter.configs").setup {
        textobjects = {
            select = {
                enable = true,
                lookahead = true,
                keymaps = {
                    ["af"] = "@function.outer",
                    ["if"] = "@function.inner",
                },
            },
        },
    }
end

return M
