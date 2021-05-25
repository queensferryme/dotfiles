#!/usr/bin/env zsh

source $HOME/.zshrc

# Upgrade MacPorts
if [ -d $HOME/.macports ]; then
    echo '========== Upgrading MacPorts =========='
    sudo port selfupdate
    sudo port upgrade outdated
    sudo port clean --all installed
    if [[ $(port echo inactive) != "" ]]; then
        sudo port uninstall --follow-dependencies inactive
    fi
    if [[ $(port echo leaves) != "" ]]; then
        sudo port uninstall --follow-dependencies leaves
    fi
fi

# Upgrade N
if [ -d $HOME/.n ]; then
    echo '========== Upgrading N =========='
    yes | n-update
    n lts
    n prune
fi

# Upgrade NVim
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

# Upgrade Pyenv
if [ -d $HOME/.pyenv ]; then
    echo '========== Upgrading Pyenv =========='
    cd $HOME/.pyenv
    git pull
    src/configure
    make -C src/
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
