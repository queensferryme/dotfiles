local fn = vim.fn
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
    fn.system { "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path }
end

require("packer").startup(function()
    use "wbthomason/packer.nvim"

    -- appearance
    use {
        "lukas-reineke/indent-blankline.nvim",
        event = "CursorHold",
        config = require("plugins.appearance").indent,
    }
    use {
        "projekt0n/github-nvim-theme",
        after = "lualine.nvim",
        config = require("plugins.appearance").theme,
    }
    use {
        "RRethy/vim-illuminate",
        config = require("plugins.appearance").illuminate,
        event = "CursorHold",
    }

    -- buffer line
    use {
        "romgrk/barbar.nvim",
        config = require("plugins.bufferline").barbar,
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
        config = require("plugins.dashboard").alpha,
        requires = "kyazdani42/nvim-web-devicons",
    }

    -- git
    use {
        "lewis6991/gitsigns.nvim",
        config = require("plugins.git").gitsigns,
        event = "CursorHold",
        requires = "nvim-lua/plenary.nvim",
    }
    use {
        "sindrets/diffview.nvim",
        cmd = "Diffview*",
        config = require("plugins.git").diffview.config,
        requires = "nvim-lua/plenary.nvim",
        setup = require("plugins.git").diffview.setup,
    }

    -- language
    ---- rust
    use "simrat39/rust-tools.nvim"

    -- miscellany
    use "dstein64/vim-startuptime"
    use "editorconfig/editorconfig-vim"
    use "lewis6991/impatient.nvim"
    use {
        "numToStr/Comment.nvim",
        config = require("plugins.miscellany").comment,
    }
    use {
        "Pocco81/AutoSave.nvim",
        config = require("plugins.miscellany").autosave,
    }
    use {
        "wakatime/vim-wakatime",
        event = "CursorHold",
    }

    -- navigation
    use {
        "abecodes/tabout.nvim",
        after = "nvim-cmp",
        config = require("plugins.navigation").tabout,
        requires = "nvim-treesitter",
    }
    use {
        "phaazon/hop.nvim",
        branch = "v1",
        cmd = "Hop*",
        config = require("plugins.navigation").hop.config,
        setup = require("plugins.navigation").hop.setup,
    }

    -- search
    use {
        "kevinhwang91/nvim-hlslens",
        config = require("plugins.search").hlslens,
        event = "CursorHold",
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
    use {
        "nvim-lualine/lualine.nvim",
        after = "nvim-gps",
        config = require("plugins.statusline").lualine,
        requires = {
            "arkav/lualine-lsp-progress",
            "kyazdani42/nvim-web-devicons",
        },
    }
    use {
        "SmiteshP/nvim-gps",
        after = "nvim-treesitter",
        config = require("plugins.statusline").gps,
        requires = "nvim-treesitter/nvim-treesitter",
    }

    -- syntax
    use {
        "nvim-treesitter/nvim-treesitter",
        config = require("plugins.syntax").treesitter.config,
        run = ":TSUpdate",
    }
    use {
        "nvim-treesitter/nvim-treesitter-textobjects",
        config = require("plugins.syntax").treesitter.textobjects,
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
        cmd = "Floaterm*",
        config = require("plugins.terminal").floaterm.config,
        setup = require("plugins.terminal").floaterm.setup,
    }
end)
