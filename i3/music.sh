#!/usr/bin/env bash

i3-msg -t get_workspaces | grep "102:music"
status=$?
i3-msg "workspace 102:music"

if [ $status -ne 0 ]; then
    st -e ncmpcpp &
    sleep 0.2s
    st -e cava &
    sleep 0.2s
    i3-msg "split vertical"
    st -e pipes &
    sleep 0.2s
    i3-msg "split horizontal; focus left"
fi

i3-msg -t get_workspaces | grep "102:music\",\"visible\":true"
status=$?

if [ $status -ne 1 ]; then
    i3-msg "layout default"
fi
