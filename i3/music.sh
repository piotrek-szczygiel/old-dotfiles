#!/usr/bin/env bash

i3-msg -t get_workspaces | grep "music"
status=$?
i3-msg "workspace music"

if [ $status -ne 0 ]; then
    urxvt -e cmus &
    sleep 0.1s
    urxvt -e cava &
    sleep 0.1s
    i3-msg "focus left"
fi
