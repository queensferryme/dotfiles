vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
    use {
        'wbthomason/packer.nvim',
        event = 'VimEnter',
    }

    -- buffer line
    use {
        'romgrk/barbar.nvim',
        config = function() require('plugins.bufferline') end,
        requires = 'kyazdani42/nvim-web-devicons',
    }

    -- completion
    use {
        'neoclide/coc.nvim',
        branch = 'release',
        config = function() require('plugins.completion') end,
    }

    -- dashboard
    use {
        'goolord/alpha-nvim',
        config = function() require('plugins.dashboard') end,
        requires = 'kyazdani42/nvim-web-devicons',
    }

    -- git
    use {
        'APZelos/blamer.nvim',
        config = function() require('plugins.git').git_blame() end,
    }
    use {
        'mhinz/vim-signify',
        config = function() require('plugins.git').git_signs() end,
        requires = 'nvim-lua/plenary.nvim',
    }

    -- miscellany
    use 'editorconfig/editorconfig-vim'
    use {
        'lukas-reineke/indent-blankline.nvim',
        config = function() require('plugins.miscellany').indent() end,
    }
    use {
        'projekt0n/github-nvim-theme',
        after = "lualine.nvim",
        config = function() require('plugins.miscellany').theme() end,
    }
    use 'wakatime/vim-wakatime'

    -- nvim-tree
    use {
        'kyazdani42/nvim-tree.lua',
        config = function() require('plugins.nvim-tree') end,
        after = 'github-nvim-theme',
        requires = 'kyazdani42/nvim-web-devicons',
    }

    -- status line
    use {
        'nvim-lualine/lualine.nvim',
        after = 'nvim-gps',
        config = function() require('plugins.statusline').lualine() end,
        requires = 'kyazdani42/nvim-web-devicons',
    }
    use {
        "SmiteshP/nvim-gps",
        after = 'nvim-treesitter',
        config = function() require('plugins.statusline').gps() end,
        requires = "nvim-treesitter/nvim-treesitter"
    }

    -- telescope
    use {
        'nvim-telescope/telescope.nvim',
        config = function() require('plugins.telescope') end,
        requires = 'nvim-lua/plenary.nvim',
    }

    -- terminal
    use {
        'voldikss/vim-floaterm',
        config = function() require('plugins.terminal') end,
    }

    -- treesitter
    use {
        'nvim-treesitter/nvim-treesitter',
        config = function() require('plugins.treesitter') end,
        event = 'VimEnter',
        run = ':TSUpdate',
    }
end)
