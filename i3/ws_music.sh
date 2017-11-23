#!/usr/bin/env bash

i3-msg -t get_workspaces | grep "101:music"
status=$?
i3-msg "workspace 101:music"

if [ $status -ne 0 ]; then
    ~/.dotfiles/i3/term.sh ncmpcpp &
    sleep 0.2s

    ~/.dotfiles/i3/term.sh cava &
    sleep 0.2s

    i3-msg "focus left"
fi

i3-msg -t get_workspaces | grep "101:music\",\"visible\":true"
status=$?

if [ $status -ne 1 ]; then
    i3-msg "layout default"
fi
