set -xg EDITOR nvim
set -xg PATH $HOME/.dotfiles/bin $HOME/.local/bin $PATH
set -xg FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*" 2>/dev/null'
set -xg FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

set -g theme_title_display_process yes

alias ls "better_ls"

alias ga "git add"
alias gc "git commit"
alias gca "git commit -a"
alias gco "git checkout --"
alias gd "git diff"
alias gl "git pull"
alias gp "git push"
alias grh "git reset HEAD"
alias gs "git status"

alias nmt "nmtui-connect"

alias o "xdg-open"

alias q "exit"

alias td "nvim ~/.todo"

alias yt "youtube-viewer"

function plan
    feh ~/MEGA/plan.png
end

function vi
    nvim $argv
end

function svi
    sudo -E nvim $argv
end
