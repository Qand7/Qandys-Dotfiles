#!/bin/bash

wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle

WPCTL_OUT=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@ | awk '{printf "%d", $2 * 100}')
MUTED=$(echo "$WPCTL_OUT" | grep -c '\[MUTED\]')


if [ "$MUTED" -eq 1 ]; then
    LABEL="Muted"
    icon_path="/usr/share/icons/hicolor/scalable/devices/volume_muted.svg"

else
    LABEL="${volume}%"
    
    if [ "$volume" -lt 45 ]; then
        icon_path="/usr/share/icons/hicolor/scalable/devices/volume_low.svg"
    else
        icon_path="/usr/share/icons/hicolor/scalable/devices/volume_high.svg"
    fi

fi


notify-send --replace-id=9999 -i "$icon_path" "Volume: $LABEL" --hint=int:value:$volume -t 1500

