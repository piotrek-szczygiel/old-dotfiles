#!/bin/sh
set -e

tty=${1:-$(tmux display -p '#{pane_tty}')}
username=$(ps -t "$tty" -o user= -o pid= -o ppid= -o command= | awk '
  !/ssh/ { user[$2] = $1; ppid[$3] = 1 }
  END {
    for (i in user)
      if (!(i in ppid))
      {
        print user[i]
        exit
      }
  }
')

hostname=$(hostname)

printf "#[fg=#1d2021,bg=white,bold] "

if [ "$username" = "root" ]; then
  printf "#[fg=colour1]root!"
else
  printf "%s" "$username"
fi

printf "#[fg=colour0,nobold]"
printf "@%s" "$hostname"
