#!/usr/bin/env bash

COLOR=$(xrdb -query | grep color15 | cut -f2 | head -1 2> /dev/null)

address="https://api.darksky.net/forecast/550a6e71cd0cb8090ce35592bca57140/50.0675,19.9050?units=si&exclude=minutely,hourly,daily,alerts,flags"
weather="$(wget -q -O- $address)"

if [ -z "$weather" ]; then
    echo -n " "
    exit
fi

[[ "$weather" =~ \"apparentTemperature\":([^,]*), ]]
temperature="${BASH_REMATCH[1]}"

temp1=""
temp2=""
temp3=""
temp4=""
temp5=""

icon="$temp1"

printf -v temperature "%d" "$temperature" > /dev/null 2>&1

if [ "$temperature" -gt 0 ]; then
    icon="$temp2"
fi
if [ "$temperature" -gt 10 ]; then
    icon="$temp3"
fi
if [ "$temperature" -gt 20 ]; then
    icon="$temp4"
fi
if [ "$temperature" -gt 30 ]; then
    icon="$temp5"
fi

echo -n "%{F${COLOR}}$icon%{F-} $temperature°C"
