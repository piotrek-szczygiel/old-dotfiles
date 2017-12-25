set -xg BROWSER google-chrome-stable

set -xg EDITOR nvim
set -xg VISUAL $EDITOR

set -xg MANPAGER "nvim -c 'set ft=man' -"

set -xg PATH $HOME/.dotfiles/bin $PATH
if test -d "$HOME/.cargo/bin"
  set -xg PATH $HOME/.cargo/bin $PATH
end
if test -d "$HOME/.local/bin"
  set -xg PATH $HOME/.local/bin $PATH
end

alias aruba "ssh -t piotr@szczygiel.tk ~/arubasession"
alias l "ls -l"
alias ll "ls -la"
alias ls "exa --git"
alias lst "ls --tree"
alias o "xdg-open"
alias orphans "pacaur -Rns (pacaur -Qtdq)"
alias plan "xdg-open ~/Dropbox/plan.png > /dev/null ^&1"
alias root "sudo -E bash"
alias td "$EDITOR ~/.todo"
alias update "pacaur -Syu"
alias vi "$EDITOR"

alias ga "git add"
alias gc "git commit"
alias gca "git commit -a"
alias gco "git checkout --"
alias gd "git difftool -y"
alias gds "git difftool -y --staged"
alias gl "git pull"
alias glg "git lg"
alias gp "git push"
alias grh "git reset HEAD"
alias gs "git status"

function q
  if tmux display-message -p '#S' ^ /dev/null | grep -q "aruba"
    tmux detach ^ /dev/null
  else
    exit
  end
end
