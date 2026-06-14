#!/bin/bash

wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

WPCTL_OUT=$(wpctl get-volume @DEFAULT_AUDIO_SOURCE@)
MUTED=$(echo "$WPCTL_OUT" | grep -c '\[MUTED\]')

if [ "$MUTED" -eq 1 ]; then
    LABEL="Muted"
else
    LABEL="Active"
fi

notify-send --replace-id=9999 "Microphone: $LABEL" -t 1500

