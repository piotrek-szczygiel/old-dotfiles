set -xg EDITOR nvim

alias finddir="find -type d | fzy"
alias findfile="find -type f | fzy"
alias findpid="ps axww -o pid,user,%cpu,%mem,start,time,command | fzy | sed 's/^ *//' | cut -f1 -d' '"

function d
    if [ $argv ]
        cd $argv
    else
        set directory (finddir)
        if [ $directory ]
            builtin cd $directory
        end
    end
end

function f
    if [ $argv ]
        eval $EDITOR $argv
    else
        set file (findfile)
        if [ $file ]
            eval $EDITOR $file
        end
    end
end

eval (python -m virtualfish auto_activation)
