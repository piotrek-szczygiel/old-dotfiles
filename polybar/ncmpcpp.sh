#!/usr/bin/env bash

song=$(echo -n $(mpc 2> /dev/null | grep -v "^volume" | head -1 | sed "s/;/, /g"))

if [ ! -z "$song" ]; then
    echo -n "%{F#bd93f9}%{F-} $song"
else
    echo -n " "
fi
