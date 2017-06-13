set -xg PATH ~/.local/bin $PATH

set -xg default_user piotr
set -xg theme_nerd_fonts yes
set -xg theme_title_use_abbreviated_path no
set -xg theme_display_user yes


if type -q nvim
    set -xg EDITOR nvim

    function n
        nvim $argv
    end

else if type -q vi
    set -xg EDITOR vi
else if type -q nano
    set -xg EDITOR nano
end

if type -q ls_colors_generator; and type -q ls-i
    set -xg LS_COLORS (ls_colors_generator)

    function ls
        ls-i --color=auto -w (tput cols) $argv
    end

    function la
        ls -la --group-directories-first $argv
    end

    function ll
        ls --almost-all -1 --group-directories-first $argv
    end

    function l
        ls -a --group-directories-first $argv
    end
end

if python3 -m virtualfish > /dev/null 2>&1
    eval (python3 -m virtualfish auto_activation) or true
end