#!/usr/bin/env bash

artist=$(echo -n $(cmus-remote -C status | grep "tag artist" -m 1 | cut -c 12-))
song=$(echo -n $(cmus-remote -C status | grep "tag title" -m 1 | cut -c 11-))

if [ ! -z "$artist" ]; then
    echo -n "           %{F#bd93f9}%{F-} $artist - $song"
else
    echo -n " "
fi
