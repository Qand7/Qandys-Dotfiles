#!/bin/bash

wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d", $2 * 100}')

if [ "$volume" -lt 45 ]; then
    icon_path="/usr/share/icons/hicolor/scalable/devices/volume_low.svg"
else
    icon_path="/usr/share/icons/hicolor/scalable/devices/volume_high.svg"
fi

notify-send --replace-id=9999 -i "$icon_path" "Volume: $volume%" --hint=int:value:$volume -t 1500

