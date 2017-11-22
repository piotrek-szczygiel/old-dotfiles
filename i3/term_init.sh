#!/usr/bin/env bash

wal -r 2> /dev/null

if [[ -z $1 ]]; then
    exec fish
else
    $*
fi
