#!/usr/bin/env zsh

source $HOME/.zshrc

# Configure proxy server
PROXY="http://127.0.0.1:7890"
export http_proxy=$PROXY
export https_proxy=$PROXY
git config --global http.proxy $PROXY
git config --global https.proxy $PROXY

# Upgrade Brew
if [[ `command -v brew` != "" ]]; then
    echo '========== Upgrading Brew =========='
    brew update
    brew upgrade
fi

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

# Upgrade Rust
if [ -d $HOME/.cargo ]; then
    echo '========== Upgrading Rust =========='
    rustup self update
    rustup update
fi

# Upgrade Zinit
if [ -d $HOME/.zinit ]; then
    echo '========== Upgrading Zinit =========='
    zinit update
fi

# End
unset http_proxy
unset https_proxy
git config --global --unset http.proxy
git config --global --unset https.proxy
echo `date` 'Update successful!'
