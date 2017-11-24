#!/usr/bin/env bash

COLOR=$(xrdb -query | grep color15 | cut -f2 | head -1 2> /dev/null)

pac=$(checkupdates 2> /dev/null | wc -l)
aur=$(cower -u 2> /dev/null | wc -l)

check=$((pac + aur))

if [[ "$check" != "0" ]]; then
    echo "%{F${COLOR}}%{F-} $pac %{F${COLOR}}%{F-} $aur"
else
    echo " "
fi
