set -xg EDITOR nvim
set -xg PATH $HOME/.dotfiles/bin $HOME/.local/bin $PATH
set -xg FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*" 2>/dev/null'
set -xg FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND

set -g theme_color_scheme zenburn
set -g theme_title_display_process yes

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

alias wifi "nmtui-connect"

alias o "xdg-open"

alias plan "feh ~/Dropbox/plan.png"

alias q "exit"

alias td "$EDITOR ~/.todo"

alias update "pacaur -Syu"

alias vi "$EDITOR"
alias svi "sudo -E $EDITOR"

alias yt "youtube-viewer"

