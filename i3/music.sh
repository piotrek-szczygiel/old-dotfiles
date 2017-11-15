#!/usr/bin/env bash

i3-msg -t get_workspaces | grep "102:music"
status=$?
i3-msg "workspace 102:music"

if [ $status -ne 0 ]; then
    st -e ncmpcpp &
    sleep 0.2s
    st -e cava &
    sleep 0.2s
    i3-msg "focus left"
fi
