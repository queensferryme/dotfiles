call plug#begin('~/.vim/plugged')
    Plug 'akinsho/nvim-bufferline.lua'
    Plug 'editorconfig/editorconfig-vim'
    Plug 'itchyny/lightline.vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'kyazdani42/nvim-web-devicons'
    Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'wakatime/vim-wakatime'
call plug#end()


runtime appearance.vim
runtime buffer-line.vim
runtime indent.vim
runtime misc.vim
runtime status-line.vim

