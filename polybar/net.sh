#!/usr/bin/env bash

LOCAL_IP=$(timeout 1 ip route get 8.8.8.8 2> /dev/null |\
    head -1 | cut -d' ' -f7)

EXTERNAL_IP=$(timeout 2 curl icanhazip.com 2> /dev/null)

if [ "$LOCAL_IP" == "192.168.2.27" ] || \
   [ "$LOCAL_IP" == "192.168.8.100" ]; then
    echo -n "%{F#8bbcd2}%{F-} LTE"
elif [ "$LOCAL_IP" == "192.168.2.28" ]; then
    echo -n "%{F#e89a00}%{F-} ADSL"
elif [ "$EXTERNAL_IP" == "149.156.124.14" ]; then
    echo -n "%{F#13eb34}%{F-} AGH"
elif [ ! -z "$EXTERNAL_IP" ]; then
    echo -n "%{F#a0d18a}%{F-} $EXTERNAL_IP"
elif [ ! -z "$LOCAL_IP" ]; then
    echo -n "%{F#ef9329}%{F-} $LOCAL_IP"
else
    echo -n "%{F#ef9329}%{F-} Unknown IP"
fi

