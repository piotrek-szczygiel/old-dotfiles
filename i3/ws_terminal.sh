#!/usr/bin/env bash

i3-msg -t get_workspaces | grep "0:terminal"
status=$?
i3-msg "workspace 0:terminal"

if [ $status -ne 0 ]; then
    urxvt -e fish -c "neofetch; and fish"
fi

i3-msg -t get_workspaces | grep "0:terminal\",\"visible\":true"
status=$?

if [ $status -ne 1 ]; then
    i3-msg "layout tabbed"
fi
