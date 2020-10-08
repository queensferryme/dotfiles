#!/usr/bin/env zsh

source $HOME/.zshrc

# Upgrade N
if [ -d $HOME/.n ]; then
    echo '========== Upgrading N =========='
    yes | n-update
    n lts
    n prune
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
fi

# Upgrade Zinit
if [ -d $HOME/.zinit ]; then
    echo '========== Upgrading Zinit =========='
    zinit update
fi

echo `date` 'Update successful!'
