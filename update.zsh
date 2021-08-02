#!/usr/bin/env zsh

source $HOME/.zshrc

# Upgrade MacPorts
if [ $(command -v brew) != "" ]; then
    echo '========== Upgrading Brew =========='
    brew upgrade
    brew cleanup -s
fi

# Upgrade N
if [ -d $HOME/.n ]; then
    echo '========== Upgrading N =========='
    n lts
    n prune
fi

# Upgrade NeoVim
if [ $(command -v nvim) != "" ]; then
    echo '========== Upgrading Neovim =========='
    nvim +PlugUpgrade +PlugUpdate +qall
fi

# Upgrade Poetry
if [ -d $HOME/.poetry ]; then
    echo '========== Upgrading Poetry =========='
    poetry self update
    poetry completions zsh > $HOME/.zinit/completions/_poetry
fi

# Upgrade Rust
if [ -d $HOME/.cargo ]; then
    echo '========== Upgrading Rust =========='
    rustup self update
    rustup update
    rustup completions zsh cargo > $HOME/.zinit/completions/_cargo
    rustup completions zsh rustup > $HOME/.zinit/completions/_rustup
fi

# Upgrade Zinit
if [ -d $HOME/.zinit ]; then
    echo '========== Upgrading Zinit =========='
    zinit self-update
    zinit update --all
fi

# End
echo `date` 'Update successful!'
