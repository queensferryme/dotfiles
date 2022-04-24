# Initialization
eval "$(sheldon source)"

# Aliases
alias bat="bat -p"
alias md="mkdir -p"
alias rmrf="rm -rfv"
alias vim="nvim"
## Exa
alias ...="cd ../.."
alias ....="cd ../../.."
alias ls="exa --sort=type"
alias ll="ls --classify --long --time-style=iso"
alias la="ll --all"
alias lla="la --git --group --header --links --inode"
alias lt="ll --level=2 --tree"

# Environment
export EDITOR=nvim
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
if [[ -f ~/.proxy ]]; then
    proxy=`cat ~/.proxy`
    export ALL_PROXY=$proxy
    export all_proxy=$proxy
    export HTTP_PROXY=$proxy
    export http_proxy=$proxy
    export HTTPS_PROXY=$proxy
    export https_proxy=$proxy
fi
## Bat
export BAT_THEME=OneHalfLight
## Cargo
[[ -d $HOME/.cargo ]] && export PATH="$HOME/.cargo/bin:$PATH"
## Delta
export DELTA_PAGER="less -+X"
## Direnv
[[ -x $(command -v direnv) ]] && zsh-defer eval "$(direnv hook zsh)"
## Go
[[ -x $(command -v go) ]] && export PATH="$(go env GOPATH)/bin/:$PATH"
## N
export N_PREFIX="$HOME/.n"
[[ -d $N_PREFIX ]] && export PATH="$N_PREFIX/bin:$PATH"
## Pyenv
if [[ -x $(command -v pyenv) ]]; then
    zsh-defer eval "$(pyenv init --path)"
    zsh-defer eval "$(pyenv init -)"
fi
## Starship
eval "$(starship init zsh)"

# Options
bindkey -v
setopt auto_cd
## History
export SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY_TIME
setopt EXTENDED_HISTORY
### Search
autoload -U down-line-or-beginning-search
autoload -U up-line-or-beginning-search
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down
bindkey '^[[1;2A' up-line-or-beginning-search
bindkey '^[[1;2B' down-line-or-beginning-search
export HISTORY_SUBSTRING_SEARCH_FUZZY=1
zle -N down-line-or-beginning-search
zle -N up-line-or-beginning-search
