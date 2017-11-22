# Environment variables

set -xg EDITOR nvim
set -xg PATH $HOME/.dotfiles/bin $HOME/.local/bin $PATH


# FZF configuration

set -xg FZF_DEFAULT_COMMAND 'rg --files --no-ignore --hidden --follow --glob "!.git/*" 2>/dev/null'
set -xg FZF_CTRL_T_COMMAND $FZF_DEFAULT_COMMAND


# Colorscheme configuration

set -g default_user piotr
set -g theme_color_scheme user
set -g theme_display_user yes
set -g theme_title_display_process yes

set __color_initial_segment_exit     bryellow grey --bold
set __color_initial_segment_su       bryellow red --bold
set __color_initial_segment_jobs     bryellow green --bold

set __color_path                     brblue 000
set __color_path_basename            brblue 000 --bold
set __color_path_nowrite             magenta 000
set __color_path_nowrite_basename    magenta 000 --bold

set __color_repo                     brgreen white --bold
set __color_repo_work_tree           brgrey white --bold
set __color_repo_dirty               brred yellow
set __color_repo_staged              yellow white

set __color_username                 brgrey white


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

alias wifi "nmtui-connect"

alias o "xdg-open"

alias plan "feh ~/Dropbox/plan.png"

alias startpage "tmux attach-session -t i3-terminal 2> /dev/null; or tmux new-session -s i3-terminal fish -c 'neofetch; and exec fish'"

alias td "$EDITOR ~/.todo"

alias update "pacaur -Syu"

alias vi "$EDITOR"
alias svi "sudo -E $EDITOR"

alias yt "youtube-viewer"

function q
    if env | grep -q "TMUX"
        if env | grep -q "VIM"
            exit
        else
            tmux detach ^ /dev/null
        end
    else
        exit
    end
end
