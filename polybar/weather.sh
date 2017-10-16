#!/usr/bin/env bash

address="https://api.darksky.net/forecast/550a6e71cd0cb8090ce35592bca57140/50.0675,19.9050?units=si&exclude=minutely,hourly,daily,alerts,flags"
weather="$(wget -q -O- $address)"

if [ -z "$weather" ]; then
    exit 1
fi

[[ "$weather" =~ \"icon\":\"([^\"]*)\" ]]
condition="${BASH_REMATCH[1]}"

[[ "$weather" =~ \"apparentTemperature\":([^,]*), ]]
temperature="${BASH_REMATCH[1]}"

temp1="%%{F#a1c8fc}%%{F-}"
temp2="%%{F#0e4cd1}%%{F-}"
temp3="%%{F#0d840d}%%{F-}"
temp4="%%{F#f2e14d}%%{F-}"
temp5="%%{F#f1aa4d}%%{F-}"

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

printf "$icon $temperature°C  "

cloud="%%{F#ddeaff}"
rain="%%{F#1405bc}"
snow="%%{F#a1c8fc}"
sun="%%{F#edfc62}"
wind="%%{F#587abc}"

raining="%%{F#5899bc}%%{F-}"
partly_cloudy="%%{F#edfc62}%%{F-}"
cloudy="%%{F#4d6775}%%{F-}"
clear_day="%%{F#f7d31d}%%{F-}"
clear_night="%%{F#587abc}%%{F-}"
snowing="%%{F#a1c8fc}%%{F-}"
foggy="%%{F#587abc}%%{F-}"
windy="%%{F#587abc}%%{F-}"
sleet="%%{F#a1c8fc}%%{F-}"
thunder="%%{F#fff3ba}%%{F-}"
hail="%%{F#a1c8fc}%%{F-}"
tornado="%%{F#ffe154}%%{F-}"

if grep -qi 'rain' <<< $condition; then
    printf "$raining Raining"
elif grep -qi 'partly-cloudy' <<< $condition; then
    printf "$partly_cloudy It's alright"
elif grep -qi 'cloudy' <<< $condition; then
    printf "$cloudy Grey and dull"
elif grep -qi 'clear-day' <<< $condition; then
    printf "$clear_day Clear day"
elif grep -qi 'clear-night' <<< $condition; then
    printf "$clear_night Starry night"
elif grep -qi 'snow' <<< $condition; then
    printf "$snowing It's snowing!"
elif grep -qi 'fog' <<< $condition; then
    printf "$foggy Spooky."
elif grep -qi 'wind' <<< $condition; then
    printf "$windy Don't fly away"
elif grep -qi 'sleet' <<< $condition; then
    printf "$sleet Sleet. Stay inside"
elif grep -qi 'thunderstorm' <<< $condition; then
    printf "$thunder The gods are wrathful"
elif grep -qi 'hail' <<< $condition; then
    printf "$hail Hail. Stay inside"
elif grep -qi 'tornado' <<< $condition; then
    printf "$tornado Tornado. Yeah."
else
    printf "Look out the window"
fi
