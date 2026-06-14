#!/bin/bash

time_hour=$(date +"%H")
time_full=$(date +"%T")

get_battery() {
    brightness_raw=$(brightnessctl get)
    brightness_max=$(brightnessctl max)
    brightness=$(( $brightness_raw / ($brightness_max / 100) ))
}

battery_health=$(cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

message_morning="Good Morning, it's <b>$time_full</b>\nBrightness is set to <b>10%</b>\nBattery is at <b>$battery_health%</b> and <b>$battery_status</b>"

message_midday="It's during the day, more precisely <b>$time_full</b>\nBrightness is set to <b>32%</b>\nBattery is at <b>$battery_health%</b> and <b>$battery_status</b>"

message_evening="It's late. To be exact, it is <b>$time_full</b>\nBrightness is set to <b>0%</b>\nBattery is at <b>$battery_health%</b> and <b>$battery_status</b>"

if [[ $time_hour -lt 6 ]]; then
    brightnessctl set 0%
    notify-send -u low "Startup Message" "$message_evening"
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%   

elif [[ $time_hour -lt 12 ]]; then
    brightnessctl set 10%
    get_battery
    notify-send "Startup Message" "$message_morning"
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 10%   

elif [[ $time_hour -lt 20 ]]; then
    brightnessctl set 32%
    get_battery
    notify-send "Startup Message" "$message_midday"
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 25%   

else
    brightnessctl set 0%
    get_battery
    notify-send "Startup Message" "$message_evening"
    wpctl set-volume @DEFAULT_AUDIO_SINK@ 0%   
fi
