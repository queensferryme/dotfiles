function setup_gps()
    require("nvim-gps").setup({
        icons = {
            ["class-name"] = ' ',
            ["function-name"] = ' ',
            ["method-name"] = ' ',
            ["container-name"] = ' ',
            ["tag-name"] = ' '
        },
        depth = 3,
    })
end

function setup_lualine()
    vim.cmd [[autocmd VimEnter * highlight StatusLine guibg=none]]
    vim.cmd [[autocmd VimEnter * highlight StatusLineNC guibg=none]]

    local gps = require('nvim-gps')

    local diagnostics_component = {
        'diagnostics',
        colored = true,
        update_in_insert = true,
    }

    local fileformat_component = {
        'fileformat',
        symbols = {
            unix = 'LF',
            dos = 'CRLF',
            mac = 'CR',
        },
    }

    local gps_component = {
        gps.get_location,
        cond = gps.is_available,
    }

    local location_component = {
        function()
            return '%2l:%-2v'
        end,
        separator = { left = '', right = '' },
    }

    local mode_component = {
        'mode',
        separator = { left = '', right = '' },
    }

    local nvim_tree_extension = {
        sections = {
            lualine_a = {
                {
                    function()
                        return vim.fn.fnamemodify(vim.fn.getcwd(), ':t')
                    end,
                    separator = { left = '', right = '' },
                }
            }
        },
        filetypes = { 'NvimTree' },
    }

    require('lualine').setup {
        options = {
            theme = 'github',
            component_separators = { left = '', right = '' },
            section_separators = { left = '', right = '' },
            disabled_filetypes = { },
        },
        sections = {
            lualine_a = { mode_component },
            lualine_b = {
                'branch',
                'diff',
                diagnostics_component,
            },
            lualine_c = {
                'filename',
                gps_component,
            },
            lualine_x = {
                'encoding',
                fileformat_component,
                'filetype',
            },
            lualine_y = { 'progress' },
            lualine_y = {},
            lualine_z = { location_component },
        },
        extensions = {
            nvim_tree_extension,
            'toggleterm',
        },
    }
end

local M = {}
M.gps = setup_gps
M.lualine = setup_lualine
return M
