local M = {}

M.alpha = function()
    local dashboard = require "alpha.themes.dashboard"

    dashboard.section.header.val = {
        "                                                     ",
        "  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗ ",
        "  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║ ",
        "  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║ ",
        "  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║ ",
        "  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║ ",
        "  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝ ",
        "                                                     ",
    }

    dashboard.section.buttons.val = {
        dashboard.button("e", "  > New File", "<Cmd>ene <Bar> startinsert<CR>"),
        dashboard.button("p", "  > Update Plugins", "<Cmd>PackerSync<CR>"),
        dashboard.button("s", "  > Settings", "<Cmd>e $MYVIMRC <Bar> cd %:p:h<CR>"),
        dashboard.button("SPC f f", "  > Find Files", "<Cmd>Telescope find_files<CR>"),
        dashboard.button("SPC f g", "  > Find Text", "<Cmd>Telescope live_grep<CR>"),
        dashboard.button("SPC f p", "  > Projects", "<Cmd>Telescope projects<CR>"),
        dashboard.button("SPC f r", "  > Frecent Files", "<Cmd>Telescope frecency<CR>"),
    }

    dashboard.section.footer.val = {
        "",
        "  " .. #vim.tbl_keys(packer_plugins) .. " plugins installed",
    }

    require("alpha").setup(dashboard.opts)
end

return M
