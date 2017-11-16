#!/usr/bin/env bash

i3-msg -t get_workspaces | grep "100:web"
status=$?
i3-msg "workspace 100:web"

if [ $status -ne 0 ]; then
    google-chrome-stable &
fi

i3-msg -t get_workspaces | grep "100:web\",\"visible\":true"
status=$?

if [ $status -ne 1 ]; then
    i3-msg "layout default"
fi
