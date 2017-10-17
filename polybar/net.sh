#!/usr/bin/env python2
# -*- encoding: utf-8 -*-

import json
import socket
import urllib

local_ip = "unknown"
external_ip = "unknown"

try:
    s = socket.socket(socket.AF_INET, socket.SOCK_DGRAM)
    s.connect(("8.8.8.8", 80))
    local_ip = s.getsockname()[0]
    s.close()

    external_ip = json.loads(urllib.urlopen("http://ip.jsontest.com/").read())["ip"]
except:
    pass

if local_ip == "192.168.2.27" or local_ip == "192.168.8.100":
    print "%{F#8bbcd2}%{F-} LTE"
elif local_ip == "192.168.2.28":
    print "%{F#e89a00}%{F-} ADSL"
elif external_ip == "149.156.124.14":
    print "%{F#13eb34}%{F-} AGH"
else:
    print "%{F#a0d18a}%{F-}", local_ip
