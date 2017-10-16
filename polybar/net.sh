#!/usr/bin/env python2
# -*- encoding: utf-8 -*-

import json
import socket
import urllib

ip = "unknown"
external_ip = "unknown"

try:
    ip = socket.gethostbyname(socket.gethostname())
    external_ip = json.loads(urllib.urlopen("http://ip.jsontest.com/").read())["ip"]
except:
    pass

if ip == "192.168.2.27":
    print "%{F#8bbcd2}%{F-} LTE"
elif ip == "192.168.2.28":
    print "%{F#e89a00}%{F-} ADSL"
elif external_ip == "149.156.124.14":
    print "%{F#13eb34}%{F-} AGH"
else:
    print "%{F#a0d18a}%{F-}", ip
