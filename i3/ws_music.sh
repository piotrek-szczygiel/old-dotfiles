#!/usr/bin/env bash

i3-msg -t get_workspaces | grep "101:music"
status=$?
i3-msg "workspace 101:music"

if [ $status -ne 0 ]; then
    urxvt -e ncmpcpp
    sleep 0.1s

    urxvt -e vis
    sleep 0.1s

    i3-msg "focus left"
fi

i3-msg -t get_workspaces | grep "101:music\",\"visible\":true"
status=$?

if [ $status -ne 1 ]; then
    i3-msg "layout default"
fi
