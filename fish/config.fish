set -xg GOPATH $HOME/go
set -xg PATH $PATH $GOPATH/bin

set -xg EDITOR "emacsclient -n -c"

# Basic aliases
alias e="$EDITOR"
alias o="xdg-open"
alias q="exit"
alias st="spacemacs_term"

# Git aliases
alias ga="git add"
alias gc="git commit"
alias gca="git commit -a"
alias gd="git diff"
alias gl="git pull"
alias gp="git push"
alias gs="git status"

function spacemacs_term
  emacsclient -n -nw -c $argv
end

# FZF settings
set -xg FZF_DEFAULT_COMMAND 'rg --files --hidden --smart-case --glob "!.git/*"'
set -xg FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

function __fzf_edit
  set -l filename (fzf)
  if [ $filename ]
    eval $EDITOR $filename
  end
end

# Keybindings
function fish_user_key_bindings
  bind \cd "__fzf_cd_with_hidden"
  bind \cr "__fzf_reverse_isearch"
  bind \cs "__fzf_edit"
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

# Emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

function fish_title
  true
end

set -xg LS_COLORS (ls_colors_generator)
function ls
  ls-i --color=always -A --group-directories-first -h -w (tput cols) $argv
end

# Virtualfish initialization
eval (python -m virtualfish auto_activation ^ /dev/null)
