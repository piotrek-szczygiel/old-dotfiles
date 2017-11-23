#!/usr/bin/sh

index=$(basename $(cat ~/.fehbg | tail -1 | cut -d" " -f3 | cut -d\' -f2) .jpg)
count=$(ls -l ~/Dropbox/wallpapers | tail -n +2 | wc -l)

index=$(($index + 1))
index=$(($index % $count))

wal -i ~/Dropbox/wallpapers/$index.jpg
