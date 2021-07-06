call plug#begin('~/.vim/plugged')
    Plug 'editorconfig/editorconfig-vim'
    Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
    Plug 'kyazdani42/nvim-tree.lua'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'mhinz/vim-signify'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
    Plug 'romgrk/barbar.nvim'
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'voldikss/vim-floaterm'
    Plug 'wakatime/vim-wakatime'
call plug#end()


runtime appearance.vim
runtime buffer-line.vim
runtime completion.vim
runtime indentation.vim
runtime shortcut.vim
runtime miscellany.vim
runtime status-line.vim
runtime tree.vim

