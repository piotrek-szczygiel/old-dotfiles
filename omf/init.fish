set -xg DOTFILES $HOME/.dotfiles

set -xg PATH $DOTFILES/bin $PATH

set fish_pager_color_progress cyan
eval (python -m virtualfish)
