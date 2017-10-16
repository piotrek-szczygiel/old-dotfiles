#!/usr/bin/env bash

i3-msg -t get_workspaces | grep "music"
status=$?
i3-msg "workspace 101:music"

if [ $status -ne 0 ]; then
    termite -e cmus &
    sleep 0.1s
    termite -e cava &
    sleep 0.1s
    i3-msg "focus left"
fi
