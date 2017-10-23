#!/usr/bin/env bash

PING=$(timeout 5 ping -c 1 www.wp.pl 2> /dev/null |\
    tail -1| awk '{print $4}' | cut -d '/' -f 2 |\
    cut -f1 -d".")

if [ ! -z "${PING}" ]; then
    echo -n "%{F#bd93f9}%{F-} ${PING}ms"
else
    echo -n "%{F#ef9329}%{F-} Disconnected"
fi
