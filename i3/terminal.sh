#!/usr/bin/env bash

i3-msg -t get_workspaces | grep "0:terminal"
status=$?
i3-msg "workspace 0:terminal"

if [ $status -ne 0 ]; then
    termite &
fi

i3-msg -t get_workspaces | grep "0:terminal\",\"visible\":true"
status=$?

if [ $status -ne 1 ]; then
    i3-msg "layout tabbed"
fi
