#!/usr/bin/env bash

i3-msg -t get_workspaces | grep "0:terminal"
status=$?
i3-msg "workspace 0:terminal"

if [ $status -ne 0 ]; then
    termite -e "fish -c 'screenfetch; and fish'" &
fi
