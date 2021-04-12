set noshowmode

autocmd VimEnter * autocmd! galaxyline WinLeave

lua << EOF
local line       = require("galaxyline")
local condition  = require("galaxyline.condition")
local buffer     = require("galaxyline.provider_buffer")
local file       = require("galaxyline.provider_fileinfo")
local vcs        = require("galaxyline.provider_vcs")
local whitespace = require("galaxyline.provider_whitespace")


local colors = {}
colors.black  = vim.g.terminal_color_0
colors.blue   = vim.g.terminal_color_4
colors.green  = vim.g.terminal_color_2
colors.grey   = "#DDDDDD"
colors.purple = vim.g.terminal_color_5
colors.red    = vim.g.terminal_color_1
colors.yellow = vim.g.terminal_color_3
colors.cyan   = vim.g.terminal_color_6
colors.white  = vim.g.terminal_color_7
colors.bg     = "transparent"
colors.fg     = vim.g.terminal_color_foreground


function LeftHalfCircleProvider()
    return ""
end

function RightHalfCircleProvider()
    return ""
end

function get_mode_color(mode)
    local color = {
        c        = colors.yellow,
        i        = colors.blue,
        n        = colors.green,
        v        = colors.purple,
        ["\x16"] = colors.purple,
        V        = colors.purple
    }
    return color[mode] or colors.red
end

function get_mode_name(mode)
    local name = {
        c        = "COMMAND",
        i        = "INSERT",
        n        = "NORMAL",
        v        = "VISUAL",
        ["\x16"] = "V-BLOCK",
        V        = "V-LINE"
    }
    return name[mode] or "UNKOWN"
end


line.short_line_list = {"NvimTree"}

line.section.short_line_left[1] = {
    ShortLineLeftStart = {
        provider = LeftHalfCircleProvider,
        highlight = {colors.green, colors.bg}
    }
}

line.section.short_line_left[2] = {
    ShortLineBufferType = {
        provider = function ()
            return "  " .. (buffer.get_buffer_filetype() or "BUFFER") .. " "
        end,
        highlight = {colors.white, colors.green}
    }
}

line.section.short_line_left[3] = {
    ShortLineRightStart = {
        provider = RightHalfCircleProvider,
        highlight = {colors.green, colors.bg}
    }
}

line.section.left[1] = {
    LeftStart = {
        provider = LeftHalfCircleProvider,
        highlight = {colors.green, colors.bg}
    }
}

line.section.left[2] = {
    ViMode = {
        provider = function ()
            local mode = vim.fn.mode()
            vim.api.nvim_command("highlight GalaxyLeftStart guifg=" .. get_mode_color(mode))
            vim.api.nvim_command("highlight GalaxyViMode    guibg=" .. get_mode_color(mode))
            return "  " .. get_mode_name(mode) .. " "
        end,
        highlight = {colors.white, colors.green}
    }
}

line.section.left[3] = {
    FileName = {
        provider = function ()
            local filename = file.get_current_file_name()
            if filename == "" then
                filename = "[No Name] "
            end
            return "  " .. filename
        end,
        highlight = {colors.fg, colors.grey}
    }
}

line.section.left[4] = {
    LeftEnd = {
        provider = RightHalfCircleProvider,
        highlight = {colors.grey, colors.bg}
    }
}

line.section.left[5] = {
    GitBranch = {
        provider = function ()
            return "  " .. "" .. (vcs.get_git_branch() or "")
        end,
        condition = condition.check_git_workspace,
        highlight = {colors.purple, colors.bg},
    }
}

line.section.right[1] = {
    RightStart = {
        provider = LeftHalfCircleProvider,
        highlight = {colors.grey, colors.bg}
    }
}

line.section.right[2] = {
    FileEncoding = {
        provider = file.get_file_encode,
        condition = function ()
            return vim.bo.fenc ~= "utf-8"
        end,
        highlight = {colors.cyan, colors.grey}
    }
}

line.section.right[3] = {
    FileFormat = {
        provider = function()
            if vim.bo.fileformat == "dos" then
                return "CRLF"
            else
                return "CR"
            end
        end,
        condition = function ()
            return vim.bo.fileformat ~= "unix"
        end,
        highlight = {colors.cyan, colors.grey},
        separator = " ",
        separator_highlight = {colors.grey, colors.grey}
    }
}

line.section.right[4] = {
    FileType = {
        provider = buffer.get_buffer_filetype,
        condition = condition.buffer_not_empty,
        highlight = {colors.cyan, colors.grey},
        separator = " ",
        separator_highlight = {colors.grey, colors.grey}
    }
}

line.section.right[5] = {
    LineColumn = {
        provider = function ()
            local line = vim.fn.line('.')
            local column = vim.fn.col('.')
            return string.format(" %1d:%1d ", line, column)
        end,
        highlight = {colors.white, colors.red},
        separator = " ",
        separator_highlight = {colors.grey, colors.grey}
    }
}

line.section.right[6] = {
    Whitespace = {
        provider = whitespace.get_item,
        highlight = {colors.white, colors.red}
    }
}

line.section.right[7] = {
    RightEnd = {
        provider = RightHalfCircleProvider,
        highlight = {colors.red, colors.bg}
    }
}
EOF

