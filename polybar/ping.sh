#!/usr/bin/env bash

PING=$(ping -c 4 www.wp.pl 2> /dev/null | tail -1| awk '{print $4}' |\
    cut -d '/' -f 2 | cut -f1 -d".")

if [ ! -z "${PING}" ]; then
    echo -n "%{F#bd93f9}%{F-} ${PING}ms"
fi
