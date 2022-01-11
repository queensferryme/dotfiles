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
        "hrsh7th/nvim-cmp",
        config = require("plugins.completion").cmp,
        event = "CursorHold",
        requires = {
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-cmdline",
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-vsnip",
            "hrsh7th/vim-vsnip",
            "onsails/lspkind-nvim",
        },
    }
    use {
        "neovim/nvim-lspconfig",
        after = "nvim-cmp",
        config = require("plugins.completion").lsp,
        requires = "williamboman/nvim-lsp-installer",
    }
    use {
        "ray-x/lsp_signature.nvim",
        after = "nvim-lspconfig",
        config = require("plugins.completion").lsp_signature,
    }
    use {
        "tami5/lspsaga.nvim",
        after = "nvim-lspconfig",
        config = require("plugins.completion").lspsaga,
    }
    use {
        "windwp/nvim-autopairs",
        after = "nvim-cmp",
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
        cmd = "LazyGit",
        config = require("plugins.git").lazygit.config,
        setup = require("plugins.git").lazygit.setup,
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
    use "dstein64/vim-startuptime"
    use "editorconfig/editorconfig-vim"
    use "lewis6991/impatient.nvim"
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
    use {
        "RRethy/vim-illuminate",
        config = require("plugins.miscellany").illuminate,
    }
    use {
        "wakatime/vim-wakatime",
        event = "CursorHold",
    }

    -- moving
    use {
        "abecodes/tabout.nvim",
        after = "nvim-cmp",
        config = require("plugins.moving").tabout,
        requires = "nvim-treesitter",
    }
    use {
        "phaazon/hop.nvim",
        branch = "v1",
        cmd = "Hop*",
        config = require("plugins.moving").hop.config,
        setup = require("plugins.moving").hop.setup,
    }

    -- search
    use {
        "rktjmp/highlight-current-n.nvim",
        config = require("plugins.search").highlight_current_n,
    }
    use {
        "nvim-telescope/telescope.nvim",
        cmd = "Telescope",
        config = require("plugins.search").telescope.config,
        requires = {
            {
                "ahmedkhalf/project.nvim",
                after = "telescope.nvim",
                config = require("plugins.search").telescope.projects,
            },
            "nvim-lua/plenary.nvim",
            {
                "nvim-telescope/telescope-frecency.nvim",
                after = "telescope.nvim",
                config = require("plugins.search").telescope.frecency,
                requires = "tami5/sqlite.lua",
            },
        },
        setup = require("plugins.search").telescope.setup,
    }

    -- status line
    use "arkav/lualine-lsp-progress"
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

    -- tree
    use {
        "kyazdani42/nvim-tree.lua",
        cmd = "NvimTree*",
        config = require("plugins.tree").tree.config,
        requires = "kyazdani42/nvim-web-devicons",
        setup = require("plugins.tree").tree.setup,
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
