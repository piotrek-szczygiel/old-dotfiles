#!/usr/bin/env fish

# Path settings
set -xg PATH ~/.local/bin $PATH

# GOPATH
if type -q go
    set -xg PATH ~/go/bin $PATH
    set -xg GOPATH ~/go
end

# Angoland: connect SSH
function angsh --description 'Connect with MOSH to angoland'
    mosh svc@10.27.1.18
end

# Angoland: mount NFS
function angfs --description 'Mount angoland NFS'
    sudo mount angoland:/home/svc/piotrek/nfs /home/piotr/work/angoland/nfs
end

# virtualenv (Python3 virtualfish)
if python3 -m virtualfish > /dev/null ^&1
    eval (python3 -m virtualfish auto_activation) or true
end

# rbenv
# set -xg PATH ~/.rbenv/bin $PATH
# if type -q rbenv
#     status --is-interactive; and source (rbenv init -|psub)
# end

# Theme settings
set -xg default_user piotr
set -xg theme_nerd_fonts yes
set -xg theme_title_use_abbreviated_path no
set -xg theme_display_user yes

# Alias: s = git status
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
