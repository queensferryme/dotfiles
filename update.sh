#!/usr/bin/env zsh

source $HOME/.zshrc

# Upgrade Homebrew
if [[ $(command -v brew) != "" ]]; then
    echo '========== Upgrading Brew =========='
    brew upgrade
    brew cleanup -s
fi

# Upgrade N
if [[ $(command -v n) != "" ]]; then
    echo '========== Upgrading N =========='
    n lts
    n prune
fi

# Upgrade Rust
if [[ $(command -v rustup) != "" ]]; then
    echo '========== Upgrading Rust =========='
    rustup self update
    rustup update
    rustup completions zsh > $HOME/.zfunc/_rustup
    rustup completions zsh cargo > $HOME/.zfunc/_cargo
fi

# Upgrade Sheldon
if [[ $(command -v sheldon) != "" ]]; then
    echo '========== Upgrading Sheldon =========='
    sheldon lock --update
fi

# End
echo `date` 'Update successful!'
