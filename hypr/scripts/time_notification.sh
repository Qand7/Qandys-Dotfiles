#!/bin/bash

cpu_temp_raw="$(cat /sys/class/thermal/thermal_zone0/temp)"
cpu_temp=$(($((cpu_temp_raw))/1000))
cpu_usage=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')


ram_usage=$(free -t | awk 'FNR == 2 {printf("%.0f\n"), $3/$2*100}'   )    # Ram usage in percent

battery_health=$(cat /sys/class/power_supply/BAT0/capacity)
battery_status=$(cat /sys/class/power_supply/BAT0/status)

brightness_raw=$(brightnessctl get)
brightness_max=$(brightnessctl max)
brightness=$(( $brightness_raw / ($brightness_max / 100) ))

# Only show battery status when it isn't discharging
if [[ ! "$battery_status" == "Discharging" ]]; then
    battery_show="($battery_status)"
else
    battery_show=""
fi

notify-send -i "Placeholder" "System Information" "<b>Date:</b> $(date +"%a, %d/%m/%Y")\n<b>Time:</b> $(date +"%T")\n\n<b>Battery:</b> $battery_health% $battery_show\n<b>Brightness:</b> $brightness%\n<b>CPU Temp:</b> $cpu_temp°\n<b>CPU Usage:</b> $cpu_usage%\n<b>RAM Usage:</b> $ram_usage%" -r 9998 -t 15000
