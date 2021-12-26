local M = {}

M.autopair = function()
    require("nvim-autopairs").setup {}
    require("cmp").event:on("confirm_done", require("nvim-autopairs.completion.cmp").on_confirm_done {})
end

M.cmp = function()
    vim.opt.completeopt = "menu,menuone,noselect"

    local cmp = require "cmp"
    local feedkeys = require("utils").feedkeys
    cmp.setup {
        snippet = {
            expand = function(args)
                vim.fn["vsnip#anonymous"](args.body)
            end,
        },
        mapping = {
            ["<C-b>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
            ["<C-f>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
            ["<C-Space>"] = cmp.mapping(cmp.mapping.complete(), { "i", "c" }),
            ["<C-y>"] = cmp.config.disable,
            ["<C-e>"] = cmp.mapping {
                i = cmp.mapping.abort(),
                c = cmp.mapping.close(),
            },
            ["<CR>"] = cmp.mapping.confirm { select = true },
            ["<Tab>"] = cmp.mapping(function()
                if cmp.visible() then
                    cmp.select_next_item()
                elseif vim.fn["vsnip#available"](1) == 1 then
                    feedkeys "<Plug>(vsnip-expand-or-jump)"
                else
                    feedkeys "<Plug>(Tabout)"
                end
            end, { "i", "s" }),
            ["<S-Tab>"] = cmp.mapping(function(fallback)
                if cmp.visible() then
                    cmp.select_prev_item()
                elseif vim.fn["vsnip#jumpable"](-1) == 1 then
                    feedkeys "<Plug>(vsnip-jump-prev)"
                else
                    feedkeys "<Plug>(TaboutBack)"
                end
            end, { "i", "s" }),
        },
        sources = cmp.config.sources {
            { name = "nvim_lsp" },
            { name = "vsnip" },
            { name = "buffer" },
        },
        formatting = {
            format = require("lspkind").cmp_format {
                with_text = true,
                maxwidth = 35,
            },
        },
    }
    cmp.setup.cmdline("/", {
        sources = {
            { name = "buffer" },
        },
    })
    cmp.setup.cmdline(":", {
        sources = cmp.config.sources {
            { name = "path" },
            { name = "cmdline" },
        },
    })
end

M.lsp = function()
    vim.diagnostic.config {
        virtual_text = true,
        signs = true,
        underline = true,
        update_in_insert = true,
        severity_sort = true,
    }

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
