set -xg GOPATH $HOME/go
set -xg PATH $HOME/.cargo/bin $GOPATH/bin $PATH

set -xg EDITOR "sm"

# Basic aliases
alias o="xdg-open"
alias q="exit"

# Git aliases
alias ga="git add"
alias gc="git commit"
alias gca="git commit -a"
alias gco="git checkout --"
alias gd="git diff"
alias gl="git pull"
alias gp="git push"
alias grh="git reset HEAD"
alias gs="git status"

# FZF settings
set -xg FZF_DEFAULT_COMMAND 'rg --files --hidden --smart-case --glob "!.git/*"'
set -xg FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

function __fzf_edit
  set -l filename (fzf)
  if [ $filename ]
    eval $argv $filename
  end
end

# Keybindings
function fish_user_key_bindings
  bind \cd "__fzf_cd_with_hidden"
  bind \cn "__fzf_edit nvim"
  bind \cr "__fzf_reverse_isearch"
  bind \cs "__fzf_edit sm"
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
