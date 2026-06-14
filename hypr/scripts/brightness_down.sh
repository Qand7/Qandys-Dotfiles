#!/bin/bash

brightnessctl set 2%-

brightness_raw=$(brightnessctl get)
brightness_max=$(brightnessctl max)
brightness=$(( $brightness_raw / ($brightness_max / 100) ))

notify-send --replace-id=9997 "Brightness: $brightness%" --hint=int:value:$brightness -t 1500

