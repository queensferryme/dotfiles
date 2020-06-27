#!/usr/bin/zsh

HOME='/home/queensferry'

source $HOME/.zshrc

# Upgrade NVM
echo '========== Upgrading NVM =========='
nvm upgrade

# Upgrade Poetry
echo '========== Upgrading Poetry =========='
poetry self update
poetry completions zsh > $HOME/.oh-my-zsh/custom/plugins/poetry/_poetry

# Upgrade Pyenv
echo '========== Upgrading Pyenv =========='
cd $(pyenv root)
git pull

# Upgrade ZSH Plugins
echo '========== Upgrading ZSH Plugins =========='
cd $HOME/.oh-my-zsh/custom/plugins/zsh-nvm
git pull
cd $HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting
git pull

echo `date` 'Cron has successfully upgraded softwares!'

