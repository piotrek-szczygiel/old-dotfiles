#!/usr/bin/env bash

pac=$(checkupdates 2> /dev/null | wc -l)
aur=$(cower -u 2> /dev/null | wc -l)

check=$((pac + aur))

if [[ "$check" != "0" ]]; then
    echo "%{F#8be9fd}%{F-} $pac %{F#5b5b5b}%{F-} $aur"
else
    echo " "
fi
