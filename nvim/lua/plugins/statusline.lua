local M = {}

M.gps = function()
    require("nvim-gps").setup {
        icons = {
            ["class-name"] = "ﴯ ",
            ["function-name"] = " ",
            ["method-name"] = " ",
            ["container-name"] = " ",
            ["tag-name"] = "ﰠ ",
        },
        depth = 3,
    }
end

M.lualine = function()
    local diagnostics_component = {
        "diagnostics",
        colored = true,
        update_in_insert = true,
    }

    local diff_component = {
        "diff",
        source = function()
            local ok, stats = pcall(vim.call, "sy#repo#get_stats")
            if not ok then
                stats = { 0, 0, 0 }
            end
            return {
                added = stats[1],
                modified = stats[2],
                removed = stats[3],
            }
        end,
    }

    local fileformat_component = {
        "fileformat",
        symbols = {
            unix = "LF",
            dos = "CRLF",
            mac = "CR",
        },
    }

    local gps = require "nvim-gps"
    local gps_component = {
        gps.get_location,
        cond = gps.is_available,
    }

    local location_component = {
        function()
            return "%2l:%-2v"
        end,
        separator = { left = "", right = "" },
    }

    local lsp_progress_component = {
        "lsp_progress",
        display_components = {
            "lsp_client_name",
            "spinner",
            { "title", "percentage", "message" },
        },
    }

    local mode_component = {
        "mode",
        separator = { left = "", right = "" },
    }

    local floaterm_extension = {
        sections = {
            lualine_a = {
                {
                    function()
                        local terminals = vim.call "floaterm#buflist#gather"
                        local terminal = vim.call "floaterm#buflist#curr"
                        local index = vim.fn.index(terminals, terminal) + 1
                        return "Floaterm #[" .. index .. "/" .. #terminals .. "]"
                    end,
                    separator = { left = "", right = "" },
                },
            },
        },
        filetypes = { "floaterm" },
    }

    local nvim_tree_extension = {
        sections = {
            lualine_a = {
                {
                    function()
                        return vim.fn.fnamemodify(vim.fn.getcwd(), ":t")
                    end,
                    separator = { left = "", right = "" },
                },
            },
        },
        filetypes = { "NvimTree" },
    }

    require("lualine").setup {
        options = {
            theme = "github",
            component_separators = { left = "", right = "" },
            section_separators = { left = "", right = "" },
            disabled_filetypes = {},
        },
        sections = {
            lualine_a = { mode_component },
            lualine_b = {
                "branch",
                diff_component,
                diagnostics_component,
            },
            lualine_c = {
                "filename",
                gps_component,
                lsp_progress_component,
            },
            lualine_x = {
                "encoding",
                fileformat_component,
                "filetype",
            },
            lualine_y = {},
            lualine_z = { location_component },
        },
        extensions = {
            floaterm_extension,
            nvim_tree_extension,
        },
    }
end

return M
