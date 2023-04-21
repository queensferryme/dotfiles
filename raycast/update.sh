#!/usr/bin/env zsh

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Update System
# @raycast.mode fullOutput

# Optional parameters:
# @raycast.icon ⬆️

# Documentation:
# @raycast.author Queensferry
# @raycast.authorURL https://github.com/queensferryme

source $HOME/.zshrc

# Upgrade Homebrew
if [[ $(command -v brew) != "" ]]; then
    brew upgrade
    brew cleanup -s
    echo '🎊 Successfully update Homebrew installations.'
fi

# Upgrade Sheldon
if [[ $(command -v sheldon) != "" ]]; then
    sheldon lock --update
    echo '🎊 Successfully update Sheldon zsh plugins.'
fi
