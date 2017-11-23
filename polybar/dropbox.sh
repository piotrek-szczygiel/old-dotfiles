#!/usr/bin/env bash

COLOR=$(xrdb -query | grep color11 | cut -f2 | head -1 2> /dev/null)
INACTIVE=$(xrdb -query | grep color1 | cut -f2 | head -1 2> /dev/null)

if pgrep -x dropbox > /dev/null; then
    echo -n "%{F${COLOR}}"
else
    echo -n "%{F${INACTIVE}}"
fi

echo -n "%{F-}"
