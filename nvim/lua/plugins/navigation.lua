local M = {}

M.hop = {}
M.hop.config = function()
    require("hop").setup {}
end
M.hop.setup = function()
    local mmap = require("utils").mmap
    mmap("", "f", "<Cmd>HopChar1CurrentLineAC<CR>")
    mmap("", "F", "<Cmd>HopChar1CurrentLineBC<CR>")
    mmap("", "s", "<Cmd>HopChar1AC<CR>")
    mmap("", "S", "<Cmd>HopChar1BC<CR>")
    mmap("", "st", "<Cmd>HopChar2<CR>")
    mmap("", "sl", "<Cmd>HopLineStart<CR>")
    mmap("", "sp", "<Cmd>HopPattern<CR>")
end

M.symbols = function()
    local map = require("utils").map
    map("<Leader>xs", "<Cmd>SymbolsOutline<CR>")

    local symbols = require("utils").symbols
    vim.g.symbols_outline = {
        auto_preview = false,
        width = 30,
        symbols = {
            Array = { icon = "" },
            Boolean = { icon = "" },
            Class = { icon = symbols.Class },
            Constant = { icon = symbols.Constant },
            Constructor = { icon = symbols.Constructor },
            Enum = { icon = symbols.Enum },
            EnumMember = { icon = symbols.EnumMember },
            Event = { icon = symbols.Event },
            Field = { icon = symbols.Field },
            File = { icon = symbols.File },
            Function = { icon = symbols.Function },
            Interface = { icon = symbols.Interface },
            Key = { icon = "" },
            Method = { icon = symbols.Method },
            Module = { icon = symbols.Module },
            Namespace = { icon = "" },
            Null = { icon = "🖾" },
            Number = { icon = "" },
            Object = { icon = "⦿" },
            Operator = { icon = symbols.Operator },
            Package = { icon = "" },
            Property = { icon = symbols.Property },
            String = { icon = "" },
            Struct = { icon = symbols.Struct },
            TypeParameter = { icon = symbols.TypeParameter },
            Variable = { icon = symbols.Variable },
        },
    }
end

M.tabout = function()
    require("tabout").setup {
        tabkey = "",
        backwards_tabkey = "",
    }
end

M.trouble = {}
M.trouble.config = function()
    vim.cmd [[highlight TroubleText gui=none]]

    require("trouble").setup {
        use_diagnostic_signs = true,
    }
end
M.trouble.setup = function()
    local map = require("utils").map
    map("<Leader>xx", "<Cmd>TroubleToggle<CR>")
end

return M
