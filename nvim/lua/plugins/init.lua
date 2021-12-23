local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
end

require("packer").startup(function()
    use "wbthomason/packer.nvim"

    -- buffer line
    use {
        "romgrk/barbar.nvim",
        config = function()
            require "plugins.bufferline"
        end,
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- completion
    use {
        "ms-jpq/coq_nvim",
        branch = "coq",
        config = require("plugins.completion").coq,
        event = "VimEnter",
        requires = {
            "ms-jpq/coq.artifacts",
            branch = "artifacts",
        },
    }
    use {
        "neovim/nvim-lspconfig",
        after = "coq_nvim",
        config = require("plugins.completion").lsp,
        requires = "williamboman/nvim-lsp-installer",
    }
    use {
        "ray-x/lsp_signature.nvim",
        config = require("plugins.completion").lsp_signature,
    }
    use {
        "tami5/lspsaga.nvim",
        config = require("plugins.completion").lspsaga,
    }
    use {
        "windwp/nvim-autopairs",
        config = require("plugins.completion").autopair,
    }

    -- dashboard
    use {
        "goolord/alpha-nvim",
        config = function()
            require "plugins.dashboard"
        end,
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- git
    use {
        "APZelos/blamer.nvim",
        config = require("plugins.git").git_blame,
    }
    use {
        "kdheepak/lazygit.nvim",
        config = require("plugins.git").lazygit,
    }
    use {
        "mhinz/vim-signify",
        config = require("plugins.git").git_signs,
        requires = "nvim-lua/plenary.nvim",
    }

    -- language
    ---- rust
    use "simrat39/rust-tools.nvim"

    -- miscellany
    use "editorconfig/editorconfig-vim"
    use {
        "lukas-reineke/indent-blankline.nvim",
        config = require("plugins.miscellany").indent,
    }
    use {
        "numToStr/Comment.nvim",
        config = require("plugins.miscellany").comment,
    }
    use {
        "Pocco81/AutoSave.nvim",
        config = require("plugins.miscellany").autosave,
    }
    use {
        "projekt0n/github-nvim-theme",
        after = "lualine.nvim",
        config = require("plugins.miscellany").theme,
    }
    use "wakatime/vim-wakatime"

    -- nvim-tree
    use {
        "kyazdani42/nvim-tree.lua",
        config = function()
            require "plugins.tree"
        end,
        after = "github-nvim-theme",
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- status line
    use {
        "nvim-lualine/lualine.nvim",
        after = "nvim-gps",
        config = require("plugins.statusline").lualine,
        requires = "kyazdani42/nvim-web-devicons",
    }
    use {
        "SmiteshP/nvim-gps",
        after = "nvim-treesitter",
        config = require("plugins.statusline").gps,
        requires = "nvim-treesitter/nvim-treesitter",
    }

    -- telescope
    use {
        "nvim-telescope/telescope.nvim",
        config = function()
            require "plugins.telescope"
        end,
        requires = "nvim-lua/plenary.nvim",
    }

    -- terminal
    use {
        "voldikss/vim-floaterm",
        config = function()
            require "plugins.terminal"
        end,
    }

    -- treesitter
    use {
        "nvim-treesitter/nvim-treesitter",
        config = function()
            require "plugins.treesitter"
        end,
    }
end)
