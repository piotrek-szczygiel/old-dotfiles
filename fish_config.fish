#!/usr/bin/env fish

## PATH settings
# Add local binary files to PATH
set -xg PATH ~/.local/bin $PATH

# Go binaries PATH
if type -q go
    set -xg PATH ~/go/bin $PATH
    set -xg GOPATH ~/go
end


## Bobthefish theme settings
set -xg default_user piotr
set -xg theme_nerd_fonts yes
set -xg theme_title_use_abbreviated_path no
set -xg theme_display_user yes


## Spacemacs settings
# Emacs ansi-term support
if test -n "$EMACS"
    set -x TERM eterm-color
end

# Fix showing title in spacemacs shell
function fish_title
    true
end


## Aliases
# Alias for spacemacs daemon gui
function smdg
    systemctl --user $argv emacsgui
end

# Alias for spacemacs daemon terminal
function smdt
    systemctl --user $argv emacsterm
end

# Alias for spacemacs gui client
function smg
    emacsclient -s gui -c $argv
end

# Alias for spacemacs terminal client
function smt
    emacsclient -s term -t $argv
end

# Some simple git aliases
if type -q git
    function ga --description 'Alias for git add'
        git add $argv
    end

    function gd --description 'Alias for git diff'
        git diff $argv
    end

    function gc --description 'Alias for git commit'
        git commit -m $argv
    end

	function gca --description 'Alias for git commit -a'
		git commit -am $argv
	end

    function gp --description 'Alias for git push'
        git push $argv
    end

    function gs --description 'Alias for git status'
        git status $argv
    end
end

# Connect to ssh with rmate functionallity
# Alias: rssh = ssh -R 52698:localhost:52698 user@host
function rssh --description 'Start ssh connection with rmate forwarding'
    ssh -R 52698:localhost:52698 $argv
end

# Set EDITOR depending on which editor is installed
if type -q smt
    set -xg EDITOR smt
else if type -q nvim
    set -xg EDITOR nvim
else if type -q vim
    set -xg EDITOR vim
else if type -q nano
    set -xg EDITOR nano
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

# virtualenv (Python3 virtualfish)
if python3 -m virtualfish > /dev/null ^&1
    eval (python3 -m virtualfish auto_activation) or true
end
