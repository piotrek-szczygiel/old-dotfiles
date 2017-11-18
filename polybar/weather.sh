#!/usr/bin/env bash

address="https://api.darksky.net/forecast/550a6e71cd0cb8090ce35592bca57140/50.0675,19.9050?units=si&exclude=minutely,hourly,daily,alerts,flags"
weather="$(wget -q -O- $address)"

if [ -z "$weather" ]; then
    echo -n " "
    exit
fi

[[ "$weather" =~ \"apparentTemperature\":([^,]*), ]]
temperature="${BASH_REMATCH[1]}"

printf "%d°C" "$temperature" 2> /dev/null
exit 0
