#!/usr/bin/env bash

COLOR=$(xrdb -query | grep color15 | cut -f2 | head -1 2> /dev/null)
INACTIVE=$(xrdb -query | grep color8 | cut -f2 | head -1 2> /dev/null)

echo -e "quit" | bluetoothctl | grep -q "\[DENON AH-GC20\]"

if [ $? -eq 0 ]; then
    echo -n "%{F${COLOR}}"
else
    echo -n "%{F${INACTIVE}}"
fi

echo -n "%{F-}"
