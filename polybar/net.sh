#!/usr/bin/env bash

COLOR=$(xrdb -query | grep color15 | cut -f2 | head -1 2> /dev/null)
INACTIVE=$(xrdb -query | grep color8 | cut -f2 | head -1 2> /dev/null)

LOCAL_IP=$(timeout 1 ip route get 8.8.8.8 2> /dev/null |\
    head -1 | cut -d' ' -f7)

EXTERNAL_IP=$(timeout 5 curl https://canihazip.com/s 2> /dev/null)

if [ "$LOCAL_IP" == "192.168.8.100" ]; then
    echo -n "%{F${COLOR}}%{F-} LTE"
elif [ ! -z "$EXTERNAL_IP" ]; then
    whois "$EXTERNAL_IP" 2> /dev/null > /tmp/whois
    grep  -q "CYFONET AGH" /tmp/whois

    if grep -q "CYFRONET AGH" /tmp/whois || [ "$EXTERNAL_IP" == "149.156.124.14" ]; then
        echo -n "%{F${COLOR}}%{F-} AGH"
    elif grep -q "NEOSTRADA-ADSL" /tmp/whois; then
        echo -n "%{F${COLOR}}%{F-} ADSL"
    elif grep -q "POLKOMTEL-MNT" /tmp/whois; then
        echo -n "%{F${COLOR}}%{F-} LTE"
    else
        echo -n "%{F${COLOR}}%{F-} $EXTERNAL_IP"
    fi
elif [ ! -z "$LOCAL_IP" ]; then
    echo -n "%{F${INACTIVE}}%{F-} $LOCAL_IP"
else
    echo -n "%{F${INACTIVE}}%{F-} Unknown IP"
fi

PING=$(timeout 5 ping -c 1 www.wp.pl 2> /dev/null |\
    tail -1| awk '{print $4}' | cut -d '/' -f 2 |\
    cut -f1 -d".")

if [ ! -z "${PING}" ]; then
    echo -n " %{F${COLOR}}%{F-} ${PING}ms"
fi

