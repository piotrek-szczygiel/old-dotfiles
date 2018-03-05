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
if test -d "$HOME/.fzf/bin"
  set -xg PATH "$HOME/.fzf/bin" $PATH
end

if type -q rustc
  set -l RUST_ROOT (rustc --print sysroot ^ /dev/null)

  set -xg RUST_SRC_PATH "$RUST_ROOT/lib/rustlib/src/rust/src"
  set -xg LD_LIBRARY_PATH "$RUST_ROOT/lib:$LD_LIBRARY_PATH"
end

set -xg FZF_TMUX 1
set -xg FZF_TMUX_HEIGHT 25%
set -xg FZF_DEFAULT_COMMAND "rg --files --no-ignore --hidden"
set -xg FZF_DEFAULT_COMMAND "$FZF_DEFAULT_COMMAND --follow --glob '!.git/*'"

alias aruba "ssh -t piotr@szczygiel.tk ~/arubasession"
alias l "ls -l"
alias ll "ls -la"
alias ls "exa --git"
alias lst "ls --tree"
alias o "xdg-open"
alias orphans "trizen -Rns (trizen -Qtdq)"
alias plan "xdg-open ~/Dropbox/plan.png > /dev/null ^&1"
alias q "exit"
alias root "sudo -E fish"
alias t "trizen"
alias td "$EDITOR ~/.todo"
alias update "trizen -Syu"
alias v "f -e $EDITOR"
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
