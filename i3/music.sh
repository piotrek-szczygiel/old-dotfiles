#!/usr/bin/env bash

i3-msg -t get_workspaces | grep "102:music"
status=$?
i3-msg "workspace 102:music"

if [ $status -ne 0 ]; then
    termite -e ncmpcpp &
    sleep 0.2s
    termite -e cava &
    sleep 0.2s
    i3-msg "focus left"
fi

i3-msg -t get_workspaces | grep "102:music\",\"visible\":true"
status=$?

if [ $status -ne 1 ]; then
    i3-msg "layout default"
fi
