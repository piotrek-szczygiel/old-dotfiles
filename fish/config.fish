# Environment variables

set -xg EDITOR nvim
set -xg VISUAL $EDITOR
set -xg PATH $HOME/.dotfiles/bin $HOME/.cargo/bin $HOME/.local/bin $PATH


# FZF configuration

set -xg FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*" 2>/dev/null'
set -xg FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND


# Colorscheme configuration

set -g default_user piotr
set -g theme_display_user yes
set -g theme_title_display_process yes

set -g theme_color_scheme gruvbox

# Aliases

alias aruba "ssh -t piotr@szczygiel.tk ~/arubasession"

alias ga "git add"
alias gc "git commit"
alias gca "git commit -a"
alias gco "git checkout --"
alias gd "git diff"
alias gl "git pull"
alias glg "git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gp "git push"
alias grh "git reset HEAD"
alias gs "git status"

alias ls "better_ls"

alias o "xdg-open"
alias orphans "pacaur -Rns (pacaur -Qtdq)"

alias plan "xdg-open ~/Dropbox/plan.png > /dev/null ^&1"

alias root "sudo -E bash"

alias td "$EDITOR ~/.todo"

alias update "pacaur -Syu"

alias vi "$EDITOR"
alias svi "sudo -E $EDITOR"

alias wifi "nmtui-connect"

alias yt "youtube-viewer"

function q
    if tmux display-message -p '#S' ^ /dev/null | grep -q "aruba"
        tmux detach ^ /dev/null
    else
        exit
    end
end
