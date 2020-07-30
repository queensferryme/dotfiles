#!/usr/bin/zsh

HOME="/home/queensferry"
source $HOME/.zshrc

export http_proxy="http://$HOST_IP:7890"
export https_proxy="http://$HOST_IP:7890"
git config --global http.proxy $http_proxy
git config --global https.proxy $https_proxy

# Upgrade N
echo '========== Upgrading N =========='
yes | n-update
n lts
n prune

# Upgrade Poetry
echo '========== Upgrading Poetry =========='
poetry self update
poetry completions zsh > $HOME/.zinit/completions/_poetry

# Upgrade Pyenv
echo '========== Upgrading Pyenv =========='
cd $(pyenv root)
git pull

# Upgrade Zinit
echo '========== Upgrading Zinit =========='
zinit update

git config --global --unset http.proxy
git config --global --unset https.proxy
echo `date` 'Cron has successfully upgraded softwares!'

