#!/bin/bash

# Needed because Artix and Hyprland have some dbus issues
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

# Variables

# Thresholds for warning to appear
# Threshold for CPU Temp
threshold_1="1000"  # Severity: 1
threshold_2="75"    # Severity: 2
threshold_3="80"    # Severity: 3

# Threshold for RAM
threshold_4=75  # My machine uses about 10% during regular use, adjust as is needed  


# Checks, associated by numbers
# Check for CPU Temp
check_1=false
check_2=false
check_3=false

# Check for RAM
check_4=false


# Main Loop
while true; do
    
    # Get CPU temperature information
    cpu_temp_raw="$(cat /sys/class/thermal/thermal_zone0/temp)"
    cpu_temp=$(($((cpu_temp_raw))/1000))
    ram_usage=$(free -t | awk 'FNR == 2 {printf("%.0f\n"), $3/$2*100}'   )    # Ram usage in percent
    
    echo $(date +"%D")
    echo $(date +"%T")
    echo
    echo "CPU Temp: $cpu_temp°"
    echo "check_1: $check_1"
    echo "check_2: $check_2"
    echo "check_3: $check_3"
    echo
    echo "RAM Usage: $ram_usage%"
    echo "check_4: $check_4"
    echo
    
    # CPU Monitor
    if [[ $cpu_temp -gt $threshold_3 && $check_3 == false ]]; then
        notify-send -u critical "CPU Temp at $cpu_temp°" "Yeah I'm melting"
        check_3=true
        
    elif [[ $cpu_temp -gt $threshold_2 && $check_2 == false ]]; then
        notify-send -u critical "CPU Temp at $cpu_temp°" "It's Getting Hot in Here"
        check_2=true
        
    elif [[ $cpu_temp -gt $threshold_1 && $check_1 == false ]]; then
        notify-send -u normal "CPU Temp at $cpu_temp°" "A Bit Warm Innit?"
        check_1=true
    fi
    
    # RAM Monitor
    if [[ $ram_usage -gt $threshold_4 && $check_4 == false ]]; then
        notify-send -u normal "RAM Usage is at $ram_usage%" "You Sure It's Supposed to be This High?"
        check_4=true
    fi


    # Check-Unchecker
#    if [[ $cpu_temp -lt $threshold_1 ]]; then
#        check_3=false
#        check_2=false
#        check_1=false
    if [[ $cpu_temp -lt $threshold_2 ]]; then
        check_3=false
        check_2=false
    elif [[ $cpu_temp -lt $threshold_3 ]]; then
        check_3=false
    fi

    if [[ $ram_usage -lt $threshold_4 ]]; then
        check_4=false
    fi

    sleep 0.5

    
done
