set -xg PATH ~/.dotfiles/bin $PATH
set -xg EDITOR nvim
set -xg BROWSER google-chrome-stable

eval (python -m virtualfish)
