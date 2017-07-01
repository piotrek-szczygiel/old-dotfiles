export EDITOR=nvim

HISTFILE=~/.zsh_history
HISTSIZE=5000
SAVEHIST=5000

bindkey -e
bindkey "\e[3~" delete-char

alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."

alias k="k -h"
alias ka="k -Ah"
alias ls="ls --color"
alias n="nvim"
alias tpminstall="$TMUX_PLUGIN_MANAGER_PATH/tpm/scripts/install_plugins.sh"

function mkcd() {
    mkdir -p "$@"  && cd $_
}

# Source zplug
source ~/.dotfiles/zplug/init.zsh

# Plugins settings
ENHANCD_DOT_ARG=...
SPACESHIP_TIME_SHOW=true

# Plugins list
zplug "b4b4r07/enhancd", use:init.sh # Requires fzy
zplug "djui/alias-tips"
zplug "chrissicool/zsh-256color"
zplug "mafredri/zsh-async"
zplug "sindresorhus/pure", use:pure.zsh, as:theme
zplug "supercrabtree/k"
zplug "zdharma/fast-syntax-highlighting", defer:2
zplug "zdharma/history-search-multi-word"

zplug "plugins/archlinux", from:oh-my-zsh
zplug "plugins/git",  from:oh-my-zsh

zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# Load plugins
zplug load
