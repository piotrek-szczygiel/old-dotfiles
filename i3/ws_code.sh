#!/usr/bin/env bash

i3-msg -t get_workspaces | grep "101:code"
status=$?
i3-msg "workspace 101:code"

if [ $status -ne 0 ]; then
    code &
fi

i3-msg -t get_workspaces | grep "101:code\",\"visible\":true"
status=$?

if [ $status -ne 1 ]; then
    i3-msg "layout tabbed"
fi

