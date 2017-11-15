#!/usr/bin/env bash

i3-msg -t get_workspaces | grep "101:code"
status=$?
i3-msg "workspace 101:code"

if [ $status -ne 0 ]; then
    code &
fi
