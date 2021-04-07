call plug#begin('~/.vim/plugged')
    Plug 'editorconfig/editorconfig-vim'
    Plug 'jiangmiao/auto-pairs'
    Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
    Plug 'wakatime/vim-wakatime'
call plug#end()


source ~/.dotfiles/vim/appearance.vim
source ~/.dotfiles/vim/indent.vim
source ~/.dotfiles/vim/misc.vim

