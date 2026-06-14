#!/bin/bash

# Needed because Artix and Hyprland have some dbus issues
export DBUS_SESSION_BUS_ADDRESS=unix:path=/run/user/$(id -u)/bus

# Variables

# Thresholds for warning to appear
threshold_warning="20"      # Severity: 1
threshold_alarm="10"        # Severity: 2
threshold_loadmeasap="1"    # Severity: 3

# Status of whether one has been warned
warned=false
alarmed=false
threatened=false


# Main Loop
while true; do
    
    # Get Battery information
    battery_health="$(cat /sys/class/power_supply/BAT0/capacity)"
    battery_status="$(cat /sys/class/power_supply/BAT0/status)"

    # Warning you once at each battery level
    if [[ $battery_status == "Discharging" ]]; then
        if [[ $battery_health == $threshold_loadmeasap && $threatened == false ]]; then
            notify-send -u critical "$battery_health% Battery Left" "Load me right this instance or I will die"
            threatened=true
        
        elif [[ $battery_health == $threshold_alarm && $alarmed == false ]]; then
            notify-send -u critical "$battery_health% Battery Left" "Battery health is too low.  Mind finding a charger?"
            alarmed=true
        
        elif [[ $battery_health == $threshold_warning && $warned == false ]]; then
            notify-send -u critical "$battery_health% Battery Left" "Health getting low. Better wrap it up slowly"
            warned=true
        fi
    fi


    # Loop to let it warn you again without reboot
    if [[ $battery_health -gt $threshold_warning ]]; then
        warned=false
        alarmed=false
        threatened=false

    elif [[ $battery_health -gt $threshold_alarm ]]; then
        alarmed=false
        threatened=false
    
    else
        threatened=true

    fi


    sleep 5
done
