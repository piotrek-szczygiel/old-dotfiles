set -xg PATH ~/.dotfiles/bin $PATH
set -xg EDITOR nvim
set -xg BROWSER google-chrome-stable

alias e="$EDITOR"

# FZF settings
set -xg FZF_DEFAULT_COMMAND 'rg --files --hidden --smart-case --glob "!.git/*"'
set -xg FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

# Keybindings
function fish_user_key_bindings
    bind \ce "$EDITOR (fzf)"
    bind \cd "__fzf_cd_with_hidden"
    bind \cr "__fzf_reverse_isearch"
    bind \ct "__fzf_find_file"
end

# Colored man pages
function man
    which man | read MAN

    set -x LESS_TERMCAP_md (printf "\e[01;31m")
    set -x LESS_TERMCAP_me (printf "\e[0m")
    set -x LESS_TERMCAP_se (printf "\e[0m")
    set -x LESS_TERMCAP_so (printf "\e[01;44;33m")
    set -x LESS_TERMCAP_ue (printf "\e[0m")
    set -x LESS_TERMCAP_us (printf "\e[01;32m")

    eval $MAN $argv
end

# Virtualfish initialization
eval (python -m virtualfish ^ /dev/null)
