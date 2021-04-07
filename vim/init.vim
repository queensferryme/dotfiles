call plug#begin('~/.vim/plugged')
    Plug 'editorconfig/editorconfig-vim'
    Plug 'lukas-reineke/indent-blankline.nvim', { 'branch': 'lua' }
    Plug 'sonph/onehalf', { 'rtp': 'vim' }
call plug#end()

source ~/.dotfiles/vim/appearance.vim
source ~/.dotfiles/vim/indent.vim

