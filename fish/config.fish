set -xg BROWSER google-chrome-stable
set -xg EDITOR nvim
set -xg VISUAL $EDITOR
set -xg PATH $HOME/.dotfiles/bin $HOME/.cargo/bin $HOME/.local/bin $PATH

set -g default_user piotr
set -g theme_display_user yes
set -g theme_title_display_process yes

set -g theme_color_scheme gruvbox

alias aruba "ssh -t piotr@szczygiel.tk ~/arubasession"
alias ls "better_ls"
alias o "xdg-open"
alias orphans "pacaur -Rns (pacaur -Qtdq)"
alias plan "xdg-open ~/Dropbox/plan.png > /dev/null ^&1"
alias root "sudo -E bash"
alias td "$EDITOR ~/.todo"
alias update "pacaur -Syu"
alias vi "$EDITOR"
alias svi "sudo -E $EDITOR"

alias ga "git add"
alias gc "git commit"
alias gca "git commit -a"
alias gco "git checkout --"
alias gd "git diff"
alias gds "git diff --staged"
alias gl "git pull"
alias glg "git log --graph --pretty=format:\
'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr)\
%C(bold blue)<%an>%Creset' --abbrev-commit"
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
