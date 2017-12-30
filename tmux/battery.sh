#!/usr/bin/env bash

set -e

command_exists() {
  local command="$1"
  type "$command" >/dev/null 2>&1
}

battery_percentage() {
  if command_exists "pmset"; then
    pmset -g batt | grep -o "[0-9]\\{1,3\\}%"
  elif command_exists "upower"; then
    battery=$(upower -e | grep -m 1 battery)
    if [ -z "$battery" ]; then
      return
    fi
    energy=$(upower -i "$battery" | awk -v nrg="$energy" '/energy:/ {print nrg+$2}')
    energy_full=$(upower -i "$battery" | awk -v nrgfull="$energy_full" '/energy-full:/ {print nrgfull+$2}')
    if [ -n "$energy" ] && [ -n "$energy_full" ]; then
      echo "$energy $energy_full" | awk '{printf("%d%%", ($1/$2)*100)}'
    fi
  elif command_exists "acpi"; then
    acpi -b | grep -m 1 -Eo "[0-9]+%"
  elif command_exists "termux-battery-status"; then
    termux-battery-status | jq -r '.percentage' | awk '{printf("%d%%", $1)}'
  fi
}

color_full_charge="#[fg=green]"
color_high_charge="#[fg=yellow]"
color_medium_charge="#[fg=colour208]" # orange
color_low_charge="#[fg=red]"

percentage=$(battery_percentage | sed -e 's/%//')

if [ -z "$percentage" ]; then
  exit 0
fi

if [ "$percentage" -eq 100 ]; then
  color="$color_full_charge"
elif [ "$percentage" -le 99 ] && [ "$percentage" -ge 51 ]; then
  color="$color_high_charge"
elif [ "$percentage" -le 50 ] && [ "$percentage" -ge 16 ]; then
  color="$color_medium_charge"
elif [ "$percentage" == "" ]; then
  exit 0
else
  color="$color_low_charge"
fi

if [ "$percentage" -lt "20" ]; then
  graph="▁"
elif [ "$percentage" -lt "40" ]; then
  graph="▂"
elif [ "$percentage" -lt "60" ]; then
  graph="▃"
elif [ "$percentage" -lt "80" ]; then
  graph="▅"
else
  graph="▇"
fi

printf "%s %s %s%% " "$color" "$graph" "$percentage"
