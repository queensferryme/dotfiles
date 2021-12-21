local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
if fn.empty(fn.glob(install_path)) > 0 then
  fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
end

require('packer').startup(function()
    use 'wbthomason/packer.nvim'

    -- buffer line
    use {
        'romgrk/barbar.nvim',
        config = function() require('plugins.bufferline') end,
        requires = 'kyazdani42/nvim-web-devicons',
    }

    -- completion
    use {
        'ms-jpq/coq_nvim',
        branch = 'coq',
        config = require('plugins.completion').coq,
        event = 'VimEnter',
        requires = {
            {
                'ms-jpq/coq.artifacts',
                branch = 'artifacts',
            }
        }
    }
    use {
        'neovim/nvim-lspconfig',
        after = 'coq_nvim',
        config = require('plugins.completion').lsp,
        requires = {
            {
                'rmagatti/goto-preview',
                config = require('plugins.completion').goto_preview,
            },
            {
                'ray-x/lsp_signature.nvim',
                config = require('plugins.completion').lsp_signature,
            },
            {
                'tami5/lspsaga.nvim',
                config = require('plugins.completion').lspsaga,
            },
            'williamboman/nvim-lsp-installer',
        },
    }
    use {
        'windwp/nvim-autopairs',
        config = require('plugins.completion').autopair,
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
        'kdheepak/lazygit.nvim',
        config = function() require('plugins.git').lazygit() end,
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
        'numToStr/Comment.nvim',
        config = function() require('plugins.miscellany').comment() end,
    }
    use {
        'Pocco81/AutoSave.nvim',
        config = function() require('plugins.miscellany').autosave() end,
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
        config = function() require('plugins.tree') end,
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
    }
end)
