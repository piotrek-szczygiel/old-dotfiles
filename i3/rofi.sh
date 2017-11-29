#!/bin/bash
. "${HOME}/.cache/wal/colors.sh"

bg=$color0
border=$color2
separator=$color2
fg=$color7
bgalt=$color0
urgent=$color9
fgalt=$color7
hlbg=$color2
hlfg=$color0

alpha="88"

bg="argb:$alpha${bg:1}"
bgalt="argb:$alpha${bgalt:1}"
border="argb:00000000"

# argument $1 expected to be window/run
exec rofi -show $1  -fullscreen -padding 350 \
                    -color-window "$bg, $border, $separator" \
                    -color-normal "$bg, $fg, $bgalt, $hlbg, $hlfg" \
                    -color-urgent "$bg, $urgent, $bgalt, $urgent, $fg" \
                    -color-active "$bg, $fg, $bgalt, $hlbg, $hlfg"
