export EDITOR="editor"
export PATH=~/.dotfiles/bin:$PATH

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

bindkey -e
bindkey "\e[3~" delete-char

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias e="$EDITOR"
alias gs="gst"
alias k="k -h"
alias ka="k -Ah"
alias kf="ka | fpp"
alias ls="ls --color"
alias q="exit"
alias tb="nc termbin.com 9999"

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

SPACESHIP_NODE_DEFAULT_VERSION="v8.0.0"
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
zplug "plugins/git",  from:oh-my-zsh
zplug "plugins/ng", from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# Load plugins
zplug load

# virtualenvwrapper
source virtualenvwrapper.sh

# n - Node Version Manager
export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"
