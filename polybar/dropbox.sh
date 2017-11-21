#!/usr/bin/env bash

COLOR=$(xrdb -query | grep color10 | cut -f2 | head -1 2> /dev/null)
INACTIVE=$(xrdb -query | grep color8 | cut -f2 | head -1 2> /dev/null)

if pgrep -x dropbox > /dev/null; then
    echo -n "%{F${COLOR}}"
else
    echo -n "%{F${INACTIVE}}"
fi

echo -n "%{F-}"
