export EDITOR="editor"
export PATH=~/.dotfiles/bin:$PATH

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

bindkey -e
bindkey "\e[3~" delete-char

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias e="$EDITOR"
alias fed="source ~/.zshrc"
alias gs="gst"
alias k="k -h"
alias ka="k -Ah"
alias kf="ka | fpp"
alias ls="ls --color"
alias q="exit"
alias tb="nc termbin.com 9999"
alias v="vtop"

function mkcd() {
    mkdir -p "$@"  && cd $_
}

function haste() {
    a=$(cat); curl -X POST -s -d "$a" https://hastebin.com/documents | awk -F '"' '{print "https://hastebin.com/"$4}';
}

# Source zplug
source ~/.dotfiles/zplug/init.zsh

# Plugins settings
ENHANCD_DOT_ARG=...

SPACESHIP_DOCKER_SHOW=false
SPACESHIP_NODE_DEFAULT_VERSION="v8.1.3"
SPACESHIP_PROMPT_SYMBOL="❯"
SPACESHIP_TIME_SHOW=true

# Plugins list
zplug "b4b4r07/enhancd", use:init.sh # Requires fzy
zplug "djui/alias-tips"
zplug "chrissicool/zsh-256color"
zplug "denysdovhan/spaceship-zsh-theme", use:spaceship.zsh, from:github, as:theme
zplug "supercrabtree/k"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zdharma/history-search-multi-word"

zplug "plugins/archlinux", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/git",  from:oh-my-zsh
zplug "plugins/ng", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# Load plugins
zplug load

# Overwrite plugins/git alias
alias gd="g difftool"

# virtualenvwrapper
source virtualenvwrapper.sh

# n - Node version manager
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"

# gvm - Go version manager
[[ -s "/home/piotr/.gvm/scripts/gvm" ]] && source "/home/piotr/.gvm/scripts/gvm"
