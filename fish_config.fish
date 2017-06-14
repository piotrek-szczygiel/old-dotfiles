#!/usr/bin/env fish

# Path settings
set -xg PATH ~/.local/bin $PATH

if type -q go
    set -xg GOPATH ~/Projekty/Go
    set -xg PATH ~/Projekty/Go/bin $PATH
end

# Theme settings
set -xg default_user piotr
set -xg theme_nerd_fonts yes
set -xg theme_title_use_abbreviated_path no
set -xg theme_display_user yes

# Alias: s = git status
if type -q git
    function s --description 'Alias for git status'
        git status
    end
end

# Alias: rssh = ssh -R 52698:localhost:52698 user@host
function rssh --description 'Start ssh connection with rmate forwarding'
    ssh -R 52698:localhost:52698 $argv
end

# Set default editor according to available programs
# Alias: n = nvim
if type -q nvim
    set -xg EDITOR nvim

    function n --description 'Alias for neovim'
        nvim $argv
    end

else if type -q vi
    set -xg EDITOR vi
else if type -q nano
    set -xg EDITOR nano
end

# fzf - fuzzy finder settings
if type -q rg; and type -q fzf
    set -xg FZF_DEFAULT_COMMAND 'rg --sort-files --files -uu -g "!{.git}/*" 2> /dev/null'
    set -xg FZF_FIND_FILE_COMMAND $FZF_DEFAULT_COMMAND

    set -xg FZF_CD_COMMAND 'rg --hidden --sort-files --files --null -g "!{.git}/*" 2> /dev/null | xargs -0 dirname | uniq'

    function fish_user_key_bindings --description 'My keybindings'
            bind \ct '__fzf_find_file'
            bind \cr '__fzf_reverse_isearch'
            bind \cx '__fzf_find_and_execute'
            bind \cd '__fzf_cd'

            bind \cq 'nvim (__fzfcmd)'
            bind \cw 'code (__fzfcmd)'
    end

end

# Set up fancy colors and icons for ls
if type -q ls_colors_generator; and type -q ls-i
    set -xg LS_COLORS (ls_colors_generator)

    function ls --description 'List files with fancy devicons'
        ls-i --color=auto -w (tput cols) $argv
    end

    function la --description 'List files with fancy devicons'
        ls -la --group-directories-first $argv
    end

    function ll --description 'List files with fancy devicons'
        ls --almost-all -1 --group-directories-first $argv
    end

    function l --description 'List files with fancy devicons'
        ls -a --group-directories-first $argv
    end
end

# Activate virtual fish (python virtualenv)
if python3 -m virtualfish > /dev/null 2>&1
    eval (python3 -m virtualfish auto_activation) or true
end
