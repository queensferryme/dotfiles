#!/usr/bin/env zsh

source $HOME/.zshrc

# Upgrade Homebrew
if [ $(command -v brew) != "" ]; then
    echo '========== Upgrading Brew =========='
    brew upgrade
    brew cleanup -s
fi

# Upgrade NeoVim
if [ $(command -v nvim) != "" ]; then
    echo '========== Upgrading Neovim =========='
    nvim +PlugUpgrade +PlugUpdate +qall
fi

# Upgrade Rust
if [ $(command -v rustup) != "" ]; then
    echo '========== Upgrading Rust =========='
    rustup self update
    rustup update
fi

# Upgrade Sheldon
if [ $(command -v sheldon) != "" ]; then
    echo '========== Upgrading Sheldon =========='
    sheldon lock --update
fi

# End
echo `date` 'Update successful!'
